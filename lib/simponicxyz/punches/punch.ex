defmodule Simponicxyz.Punches.Punch do
  use Ecto.Schema
  import Ecto.Changeset

  schema "punches" do
    field :end, :utc_datetime
    field :start, :utc_datetime
    field :task, :string
    belongs_to :user, Simponicxyz.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(punch, attrs) do
    punch
    |> cast(attrs, [:task, :start, :end])
  end
end
