defmodule ReactRenderDemoWeb.PageController do
  use ReactRenderDemoWeb, :controller

  def index(conn, _params) do
    component_path = "#{File.cwd!()}/assets/js/containers/ServerContainer.js"

    app = ReactRender.render_root(component_path, %{}, location: conn.request_path)

    render(conn, "index.html", app: app)
  end
end
