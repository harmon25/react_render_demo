defmodule ReactRenderDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  @mix_env Mix.env()
  use Application

  def start(_type, _args) do
    react_render_opts =
      if @mix_env in [:dev, :test] do
        [render_service_path: "#{File.cwd!()}/assets", pool_size: 4]
      else
        [
          render_service_path: Application.app_dir(:react_render_demo, "priv/assets"),
          pool_size: 4
        ]
      end

    children = [
      # Start the Telemetry supervisor
      ReactRenderDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ReactRenderDemo.PubSub},
      %{
        id: ReactRender,
        start: {ReactRender, :start_link, [react_render_opts]},
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
