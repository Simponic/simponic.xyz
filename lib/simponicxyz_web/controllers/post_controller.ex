defmodule SimponicxyzWeb.PostController do
  use SimponicxyzWeb, :controller
  import Ecto.Query

  alias Simponicxyz.Blogs
  alias Simponicxyz.Blogs.Comment
  alias Simponicxyz.Blogs.Post
  alias Simponicxyz.Repo

  def index(conn, _params) do
    posts = if !is_nil(conn.assigns[:current_user]) && conn.assigns[:current_user].role == "admin", do: Blogs.list_posts(), else: Repo.all(from p in Post, where: p.public == true)
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Blogs.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Blogs.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Blogs.get_post!(id)
    post_w_comments = post |> Repo.preload([comments: {(from c in Comment, order_by: c.id), [:user]}])
    comment_changeset = if !is_nil(conn.assigns[:current_user]), do: Blogs.change_comment(%Comment{}, %{"post_id" => id, "user_id" => conn.assigns[:current_user].id}), else: nil 
    if post.public do
      render(conn, "show.html", post: post_w_comments, comment_changeset: comment_changeset)
    else
      if !is_nil(conn.assigns[:current_user]) && conn.assigns[:current_user].role == "admin" do
        render(conn, "show.html", post: post_w_comments, comment_changeset: comment_changeset)
      else
        conn
        |> put_flash(:error, "This post is private.")
        |> redirect(to: Routes.post_path(conn, :index))
      end
    end
  end

  def edit(conn, %{"id" => id}) do
    post = Blogs.get_post!(id)
    changeset = Blogs.change_post(post)
    render(conn, "edit.html", post: post, changeset: changeset)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blogs.get_post!(id)

    case Blogs.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: Routes.post_path(conn, :show, post))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", post: post, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Blogs.get_post!(id)
    {:ok, _post} = Blogs.delete_post(post)

    conn
    |> put_flash(:info, "Post deleted successfully.")
    |> redirect(to: Routes.post_path(conn, :index))
  end
end
