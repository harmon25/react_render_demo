defmodule ReactRenderDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ReactRenderDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ReactRenderDemo.PubSub},
      %{
        id: ReactRender,
        start:
          {ReactRender, :start_link,
           [[render_service_path: "#{File.cwd!()}/assets", pool_size: 4]]},
        type: :supervisor
      },
      # Start the Endpoint (http/https)
      ReactRenderDemoWeb.Endpoint
      # Start a worker by calling: ReactRenderDemo.Worker.start_link(arg)
      # {ReactRenderDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReactRenderDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ReactRenderDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
