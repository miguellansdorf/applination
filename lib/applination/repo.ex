defmodule Applination.Repo do
  use Ecto.Repo,
    otp_app: :applination,
    adapter: Ecto.Adapters.Postgres
end
