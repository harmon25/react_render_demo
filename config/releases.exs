import Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

scheme =
  if System.get_env("HTTPS") == "true" do
    "https"
  else
    "http"
  end

config :react_render_demo, ReactRenderDemoWeb.Endpoint,
  url: [
    host: System.get_env("HOSTNAME") || "localhost",
    port: String.to_integer(System.get_env("PUBLIC_PORT") || "80"),
    scheme: scheme
  ],
  http: [
    port: String.to_integer(System.get_env("LISTEN_PORT") || "4000"),
    transport_options: []
  ],
  secret_key_base: secret_key_base
