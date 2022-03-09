defmodule SimponicxyzWeb.CommentController do
  use SimponicxyzWeb, :controller

  alias Simponicxyz.Blogs
  alias Simponicxyz.Blogs.Comment

  alias SimponicxyzWeb.AuthorizeHelper

  plug AuthorizeHelper, %{resource: Comment} when action in [:delete, :edit, :update] 

  def index(conn, _params) do
    comments = Blogs.list_comments()
    render(conn, "index.html", comments: comments)
  end

  def new(conn, _params) do
    changeset = Blogs.change_comment(%Comment{})
    render(conn, "new.html", changeset: changeset)
  end

  defp authorize(conn, comment_params) do
    user = conn.assigns[:current_user]
    !is_nil(user) && (String.to_integer(comment_params["user_id"]) == user.id || user.role == "admin")
  end

  def create(conn, %{"comment" => comment_params}) do
    if authorize(conn, comment_params) do
      case Blogs.create_comment(comment_params) do
        {:ok, _comment} ->
          conn
          |> put_flash(:info, "Comment created successfully.")
          |> redirect(to: NavigationHistory.last_path(conn))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end
    
    conn
    |> put_flash(:error, "Nice try")
    |> redirect(to: NavigationHistory.last_path(conn))
  end

  def show(conn, %{"id" => id}) do
    comment = Blogs.get_comment!(id)
    render(conn, "show.html", comment: comment)
  end

  def edit(conn, %{"id" => id}) do
    comment = Blogs.get_comment!(id)
    changeset = Blogs.change_comment(comment)
    render(conn, "edit.html", comment: comment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "comment" => comment_params}) do
    comment = Blogs.get_comment!(id)

    if authorize(conn, comment_params) do
      case Blogs.update_comment(comment, comment_params) do
        {:ok, comment} ->
          conn
          |> put_flash(:info, "Comment updated successfully.")
          |> redirect(to: NavigationHistory.last_path(conn))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", comment: comment, changeset: changeset)
      end
    end

    conn
    |> put_flash(:error, "Nice try")
    |> redirect(to: NavigationHistory.last_path(conn))
  end

  def delete(conn, %{"id" => id}) do
    comment = Blogs.get_comment!(id)
    {:ok, _comment} = Blogs.delete_comment(comment)

    conn
    |> put_flash(:info, "Comment deleted successfully.")
    |> redirect(to: NavigationHistory.last_path(conn))
  end
end
