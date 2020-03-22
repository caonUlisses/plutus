defmodule Plutus.Repo do
  use Ecto.Repo,
    otp_app: :plutus,
    adapter: Ecto.Adapters.Postgres
end
