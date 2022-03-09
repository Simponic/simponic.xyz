defmodule Simponicxyz.Repo.Migrations.AddPublicColumn do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :public, :boolean, default: true, null: false
    end
  end
end
