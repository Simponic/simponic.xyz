defmodule SimponicxyzWeb.MotdController do
  use SimponicxyzWeb, :controller

  alias Simponicxyz.Motds
  alias Simponicxyz.Motds.Motd

  def index(conn, _params) do
    motds = Motds.list_motds()
    render(conn, "index.html", motds: motds)
  end

  def new(conn, _params) do
    changeset = Motds.change_motd(%Motd{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"motd" => motd_params}) do
    case Motds.create_motd(motd_params) do
      {:ok, motd} ->
        conn
        |> put_flash(:info, "Motd created successfully.")
        |> redirect(to: Routes.motd_path(conn, :show, motd))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    motd = Motds.get_motd!(id)
    render(conn, "show.html", motd: motd)
  end

  def edit(conn, %{"id" => id}) do
    motd = Motds.get_motd!(id)
    changeset = Motds.change_motd(motd)
    render(conn, "edit.html", motd: motd, changeset: changeset)
  end

  def update(conn, %{"id" => id, "motd" => motd_params}) do
    motd = Motds.get_motd!(id)

    case Motds.update_motd(motd, motd_params) do
      {:ok, motd} ->
        conn
        |> put_flash(:info, "Motd updated successfully.")
        |> redirect(to: Routes.motd_path(conn, :show, motd))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", motd: motd, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    motd = Motds.get_motd!(id)
    {:ok, _motd} = Motds.delete_motd(motd)

    conn
    |> put_flash(:info, "Motd deleted successfully.")
    |> redirect(to: Routes.motd_path(conn, :index))
  end
end
