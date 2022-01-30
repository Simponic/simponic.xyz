defmodule Simponicxyz.Blogs.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string

    belongs_to :user, Simponicxyz.Accounts.User
    belongs_to :post, Simponicxyz.Blogs.Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
    |> validate_length(:body, min: 1, max: 500)
  end
end
