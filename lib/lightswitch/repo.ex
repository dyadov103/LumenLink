defmodule Lightswitch.Repo do
  use Ecto.Repo,
    otp_app: :lightswitch,
    adapter: Ecto.Adapters.Postgres
end
