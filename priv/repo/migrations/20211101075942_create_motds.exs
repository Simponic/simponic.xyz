defmodule Simponicxyz.Repo.Migrations.CreateMotds do
  use Ecto.Migration

  def change do
    create table(:motds) do
      add :message, :string

      timestamps()
    end
  end
end
