defmodule ReactRenderDemoWeb.PageController do
  use ReactRenderDemoWeb, :controller
  @mix_env Mix.env()
  def index(conn, _params) do
    component_path =
      if @mix_env in [:dev, :test] do
        "#{File.cwd!()}/assets/js/containers/ServerContainer.js"
      else
        Application.app_dir(:react_render_demo, "priv/assets/js/containers/ServerContainer.js")
      end

    app = ReactRender.render_root(component_path, %{location: conn.request_path})

    render(conn, "index.html", app: app)
  end
end
