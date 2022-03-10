defmodule Simponicxyz.Blogs.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :subtitle, :string
    field :title, :string
    field :public, :boolean

    has_many :comments, Simponicxyz.Blogs.Comment, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :subtitle, :content, :public])
    |> validate_required([:title, :subtitle, :content, :public])
  end
end
