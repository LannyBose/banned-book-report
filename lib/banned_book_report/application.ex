defmodule BannedBookReport.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BannedBookReport.Repo,
      # Start the Telemetry supervisor
      BannedBookReportWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BannedBookReport.PubSub},
      # Start the Endpoint (http/https)
      BannedBookReportWeb.Endpoint
      # Start a worker by calling: BannedBookReport.Worker.start_link(arg)
      # {BannedBookReport.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BannedBookReport.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BannedBookReportWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
