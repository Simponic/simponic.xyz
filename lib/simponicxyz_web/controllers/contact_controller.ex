defmodule SimponicxyzWeb.ContactController do
  import Swoosh.Email
  use SimponicxyzWeb, :controller
  alias Simponicxyz.Mailer

  def index(conn, _params) do
    conn
    |> render("index.html", form: get_session(conn, :previous))
  end

  def validate_captcha(h_response) do
    url = to_charlist("https://hcaptcha.com/siteverify")
    type = 'application/x-www-form-urlencoded' 
    secret = System.get_env("HCAPTCHA_SECRET")
    body = to_charlist("response=" <> h_response <> "&secret=" <> secret)
    case :httpc.request(:post, {url, [], type, body}, [], []) do
      {:ok, {{'HTTP/1.1', 200, 'OK'}, _headers, body}} -> 
        case Jason.decode(body) do
          {:ok, body} ->
            if (body["success"]) do
              true
            else
              nil
            end
        end
      _ ->
        nil
    end
  end

  def send(conn, params) do
    if validate_captcha(params["h-captcha-response"]) do
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