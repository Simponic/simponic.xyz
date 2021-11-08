defmodule SimponicxyzWeb.ContactController do
  import Swoosh.Email
  use SimponicxyzWeb, :controller
  alias Simponicxyz.Mailer

  def index(conn, _params) do
    case Captcha.get() do
      {:ok, text, img_binary} ->
        conn
        |> put_session(:captcha_text, text)
        |> render("index.html", image: "data:image/gif;base64," <> Base.encode64(img_binary), form: get_session(conn, :previous))
      {:timeout} ->
        true
    end
  end

  def send(conn, params) do
    if params["captcha"] == get_session(conn, :captcha_text) do
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
          |> redirect(to: Routes.page_path(conn, :index))
        {:error, _} ->
          conn
          |> put_flash(:error, "Error sending mail")
          |> redirect(to: Routes.page_path(conn, :index))
      end
    else
      conn
      |> put_session(:previous, params)
      |> put_flash(:error, "Captcha failed")
      |> redirect(to: Routes.contact_path(conn, :index))
    end
  end

  def delete_form_session(conn, _params) do
    conn
    |> put_session(:previous, nil)
    |> redirect(to: Routes.contact_path(conn, :index))
  end
end