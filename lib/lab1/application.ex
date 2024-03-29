defmodule Lab1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Lab1Web.Telemetry,
      # Start the Ecto repository
      Lab1.Repo,
      # Start the Mogno repository
      {Mongo, Lab1.Mongo.config()},
      # Start the PubSub system
      {Phoenix.PubSub, name: Lab1.PubSub},
      # Start Finch
      {Finch, name: Lab1.Finch},
      # Start the Endpoint (http/https)
      Lab1Web.Endpoint
      # Start a worker by calling: Lab1.Worker.start_link(arg)
      # {Lab1.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Lab1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Lab1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
