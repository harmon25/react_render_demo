# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :react_render_demo, ReactRenderDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Umm+IKlEKl1Bxi6EY972SfkRKaSDLeN+87a9NhEUYC5S+RYeblkUa7PpIMIh9+Iv",
  render_errors: [view: ReactRenderDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ReactRenderDemo.PubSub,
  live_view: [signing_salt: "Maw0Yhor"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
