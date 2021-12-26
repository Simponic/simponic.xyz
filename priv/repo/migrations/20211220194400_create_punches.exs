defmodule Simponicxyz.Repo.Migrations.CreatePunches do
  use Ecto.Migration

  def change do
    create table(:punches) do
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :user_id, references(:users)

      timestamps()
    end
  end
end
