defmodule Simponicxyz.Repo.Migrations.AddTaskColumn do
  use Ecto.Migration

  def change do
    alter table(:punches) do
      add :task, :string
    end
  end
end
