defmodule Simponicxyz.BlogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Simponicxyz.Blogs` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        subtitle: "some subtitle",
        title: "some title"
      })
      |> Simponicxyz.Blogs.create_post()

    post
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body",
        user_id: 42
      })
      |> Simponicxyz.Blogs.create_comment()

    comment
  end
end
