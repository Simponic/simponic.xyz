defmodule Simponicxyz.Motds.Motd do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:message]}

  schema "motds" do
    field :message, :string

    timestamps()
  end

  @doc false
  def changeset(motd, attrs) do
    motd
    |> cast(attrs, [:message])
    |> validate_required([:message])
  end
end
