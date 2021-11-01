defmodule SimponicxyzWeb.PageController do
  use SimponicxyzWeb, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
