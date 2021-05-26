defmodule Cx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # Cx.Repo,
      # Start the Telemetry supervisor
      CxWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Cx.PubSub},
      # Start the Endpoint (http/https)
      CxWeb.Endpoint
      # Start a worker by calling: Cx.Worker.start_link(arg)
      # {Cx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
