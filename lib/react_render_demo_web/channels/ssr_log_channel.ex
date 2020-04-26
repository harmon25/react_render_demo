defmodule ReactRenderDemoWeb.SSRLogChannel do
  use Phoenix.Channel, log_handle_in: false
  require Logger

  def join("ssr_logs:all", _message, socket) do
    Logger.debug("Whoo!")
    {:ok, socket}
  end

  def join("ssr_logs:" <> _node_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("log", %{"log" => log}, socket) do
    Logger.debug("SSR Log: " <> inspect(log))
    {:noreply, socket}
  end

  def handle_in("error", %{"log" => log}, socket) do
    Logger.error("SSR Error: " <> inspect(log))
    {:noreply, socket}
  end
end
