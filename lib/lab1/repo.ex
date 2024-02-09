defmodule Lab1.Repo do
  use Ecto.Repo,
    otp_app: :lab1,
    adapter: Ecto.Adapters.Postgres
end
