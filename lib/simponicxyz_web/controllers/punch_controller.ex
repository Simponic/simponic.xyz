defmodule SimponicxyzWeb.PunchController do
  use SimponicxyzWeb, :controller

  alias Simponicxyz.Punches
  alias Simponicxyz.Punches.Punch
  alias SimponicxyzWeb.AuthorizeHelper

  plug AuthorizeHelper, %{resource: Punch} when action in [:delete, :edit, :update, :end_timer] 

  def index(conn, _params) do
    punches = Punches.filter_punches_by_user_id(conn.assigns[:current_user].id)
    currently_running = Enum.filter(punches, fn x -> is_nil(x.end) end)
    task_names = punches |> Enum.map(fn x -> x.task end) |> Enum.filter(fn x -> x end) |> Enum.uniq
    render(conn, "index.html", punches: punches, currently_running: currently_running, task_names: task_names)
  end

  def new(conn, _params) do
    changeset = Punches.change_punch(%Punch{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"punch" => punch_params}) do
    case Punches.create_punch(Map.put(punch_params, "user", conn.assigns[:current_user])) do 
      {:ok, _punch} ->
        conn
        |> put_flash(:info, "Punch created successfully.")
        |> redirect(to: Routes.punch_path(conn, :index))
        |> halt()

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    punch = Punches.get_punch!(id)
    render(conn, "show.html", punch: punch)
  end

  def edit(conn, %{"id" => id}) do
    punch = Punches.get_punch!(id)
    changeset = Punches.change_punch(punch)
    render(conn, "edit.html", punch: punch, changeset: changeset)
  end

  def update(conn, %{"id" => id, "punch" => punch_params}) do
    punch = Punches.get_punch!(id)

    case Punches.update_punch(punch, punch_params) do
      {:ok, punch} ->
        conn
        |> put_flash(:info, "Punch updated successfully.")
        |> redirect(to: Routes.punch_path(conn, :show, punch))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", punch: punch, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    punch = Punches.get_punch!(id)
    {:ok, _punch} = Punches.delete_punch(punch)

    conn
    |> put_flash(:info, "Punch deleted successfully.")
    |> redirect(to: Routes.punch_path(conn, :index))
    |> halt()
  end

  def delete_all(conn, _params) do
    Punches.delete_punches_by_user(conn.assigns[:current_user].id)
    
    conn
    |> put_flash(:info, "Punches deleted successfully.")
    |> redirect(to: Routes.punch_path(conn, :index))
    |> halt()
  end

  def end_timer(conn, %{"id" => id}) do
    Punches.get_punch!(id)
    |> Punches.update_punch(%{:end => DateTime.utc_now()})

    conn
    |> put_flash(:info, "Ended timer")
    |> redirect(to: Routes.punch_path(conn, :index))
    |> halt()
  end

  def start_new(conn, params) do
    create(conn, %{"punch" => %{"start" => DateTime.utc_now(), "task" => params["task"]}})
  end

  defp intersection(i1, i2) do
    # Calculate the intersection between two Timex.Interval in microseconds
    cond do
      i2.from > i1.until -> 
        0
      i1.from > i2.until ->
        0
      true -> 
        abs(Timex.diff(min(i1.until, i2.until), max(i1.from, i2.from)))
    end
  end

  defp construct_intervals(start, end_t, m \\ []) do
    current_start = Timex.shift(end_t, days: -1)
    if Enum.member?([:gt, :eq], DateTime.compare(current_start, start)) do
      construct_intervals(start, current_start, [Timex.Interval.new(from: current_start, until: end_t) | m])
    else
      m
    end
  end

  def export(conn, %{"start" => start, "end" => end_t, "timezone" => timezone, "task" => task} = _params) do
    interval = %{:start => Timex.parse!(start, "{ISO:Extended:Z}"), :end_t => Timex.parse!(end_t, "{ISO:Extended:Z}")} 
    intervals = construct_intervals(interval.start, interval.end_t)
    punches = Punches.in_date_range_by_user_where_task(conn.assigns[:current_user].id, interval, task)
    |> Enum.map(fn punch -> 
        punch_interval = Timex.Interval.new(from: punch.start, until: punch.end)
        # Get the amount of time this punch intersects with the current interval
        Enum.map(intervals, fn interval -> 
          Float.round(intersection(interval, punch_interval) / (:math.pow(10, 6) * 60 * 60), 2)
        end)
      end)
    total_time_per_interval = Enum.reduce(punches, %{}, fn x,a -> 
      # Get the total amount of microseconds for punches between each interval
      Map.merge(a, Enum.zip(intervals, x) |> Enum.into(%{}), fn _k,l,m -> l+m end)
    end)

    total_time = Float.round(Enum.reduce_while(intervals, 0, fn x,a -> if y=Map.get(total_time_per_interval, x), do: {:cont, a+y}, else: {:halt, a} end), 2)
    pdf_html = PdfGenerator.generate_binary!(Phoenix.View.render_to_string(SimponicxyzWeb.PunchView, "pdf_export.html", total_time_per_interval: total_time_per_interval, intervals: intervals, timezone: timezone, total_time: total_time))

    send_download(
      conn,
      {:binary, pdf_html},
      content_type: "application/pdf",
      filename: Calendar.strftime(interval.start, "%m/%d/%Y") <> "-" <> Calendar.strftime(interval.end_t, "%m/%d/%Y") <> ".pdf"
    )
#    render(conn, "pdf_export.html", total_time_per_interval: total_time_per_interval, intervals: intervals, timezone: timezone, total_time: total_time)
  end
end
