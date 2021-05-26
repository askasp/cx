# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cx,
  ecto_repos: [Cx.Repo]

# Configures the endpoint
config :cx, CxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0b88O8gj0ADSOK/GjbsccDWgjJiYL85pXKKPO8Ry/1r9TXvcil1eBBDi6LB/2CHC",
  render_errors: [view: CxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Cx.PubSub,
  live_view: [signing_salt: "IM/M3cva"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
