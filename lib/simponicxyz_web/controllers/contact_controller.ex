defmodule SimponicxyzWeb.ContactController do
  import Swoosh.Email
  use SimponicxyzWeb, :controller
  alias Simponicxyz.Mailer

  def index(conn, _params) do
    conn
    |> render("index.html")
  end

  def send(conn, params) do
    mail = new()
      |> from(System.get_env("CONTACT_EMAIL") || "sender@example.com")
      |> to(System.get_env("TO_EMAIL") || "receiver@example.com")
      |> subject("FORM SUBMISSION: " <> params["name"])
      |> text_body(params["message"])
      |> Mailer.deliver()
    case mail do
      {:ok, _} -> 
        conn
        |> put_flash(:info, "Thank you!")
        |> render("index.html")
      {:error, x} ->
        IO.puts(inspect(x))
        conn
        |> put_flash(:error, "Error sending mail")
        |> render("index.html")
    end
  end
end