# lib/your_static_server_web/controllers/page_controller.ex
defmodule LightswitchWeb.PageController do
  use LightswitchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
