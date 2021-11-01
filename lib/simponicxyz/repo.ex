defmodule Simponicxyz.Repo do
  use Ecto.Repo,
    otp_app: :simponicxyz,
    adapter: Ecto.Adapters.Postgres
end
