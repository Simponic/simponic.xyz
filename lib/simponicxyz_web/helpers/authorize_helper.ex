defmodule SimponicxyzWeb.AuthorizeHelper do
  use Phoenix.Controller
  alias Simponicxyz.Repo
  import Plug.Conn
  import Ecto.Query
  def init(opts) do
    opts
  end
 
  def is_admin?(user) do
    if !is_nil(user) do
      user.role == "admin"
    else
      false
    end
  end

  def call(conn, opts \\ %{}) do
    user = conn.assigns[:current_user]
    %Plug.Conn{params: %{"id" => resource_id}} = conn
    resource = Repo.one(from x in Map.fetch!(opts, :resource), where: x.id == ^resource_id)
    if is_admin?(user) || resource.user_id == user.id do
      conn
    else
      conn
      |> put_flash(:error, "You are not authorized to do that.")
      |> redirect(to: NavigationHistory.last_path(conn))
      |> halt()
    end
  end
end