defmodule Simponicxyz.BlogsTest do
  use Simponicxyz.DataCase

  alias Simponicxyz.Blogs

  describe "posts" do
    alias Simponicxyz.Blogs.Post

    import Simponicxyz.BlogsFixtures

    @invalid_attrs %{content: nil, subtitle: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blogs.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blogs.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{content: "some content", subtitle: "some subtitle", title: "some title"}

      assert {:ok, %Post{} = post} = Blogs.create_post(valid_attrs)
      assert post.content == "some content"
      assert post.subtitle == "some subtitle"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{content: "some updated content", subtitle: "some updated subtitle", title: "some updated title"}

      assert {:ok, %Post{} = post} = Blogs.update_post(post, update_attrs)
      assert post.content == "some updated content"
      assert post.subtitle == "some updated subtitle"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_post(post, @invalid_attrs)
      assert post == Blogs.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blogs.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blogs.change_post(post)
    end
  end

  describe "comments" do
    alias Simponicxyz.Blogs.Comment

    import Simponicxyz.BlogsFixtures

    @invalid_attrs %{body: nil, user_id: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Blogs.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Blogs.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{body: "some body", user_id: 42}

      assert {:ok, %Comment{} = comment} = Blogs.create_comment(valid_attrs)
      assert comment.body == "some body"
      assert comment.user_id == 42
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{body: "some updated body", user_id: 43}

      assert {:ok, %Comment{} = comment} = Blogs.update_comment(comment, update_attrs)
      assert comment.body == "some updated body"
      assert comment.user_id == 43
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_comment(comment, @invalid_attrs)
      assert comment == Blogs.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Blogs.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Blogs.change_comment(comment)
    end
  end
end