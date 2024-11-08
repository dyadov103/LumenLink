defmodule Lightswitch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Lightswitch.Repo,
      # Start the Telemetry supervisor
      LightswitchWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Lightswitch.PubSub},
      # Start the Endpoint (http/https)
      LightswitchWeb.Endpoint,
      # Start a worker by calling: Lightswitch.Worker.start_link(arg)
      # {Lightswitch.Worker, arg}
      Lightswitch.Consumer
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lightswitch.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LightswitchWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
