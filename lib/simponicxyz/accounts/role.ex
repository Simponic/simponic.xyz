defmodule Simponicxyz.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :name, :string

    has_many :users, Simponicxyz.Accounts.User
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [])
    |> validate_required([])
  end
end
