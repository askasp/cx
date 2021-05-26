defmodule Cx.Repo do
  use Ecto.Repo,
    otp_app: :cx,
    adapter: Ecto.Adapters.Postgres
end
