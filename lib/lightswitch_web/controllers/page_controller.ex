# lib/your_static_server_web/controllers/page_controller.ex
defmodule LightswitchWeb.PageController do
  use LightswitchWeb, :controller

  def index(conn, _params) do
    %{
      id: "1",
      link: "sensorxperience.com",
      title: "The best website in the world"
    }
  end

  def home(conn, _params) do
    text conn, "Application Skeleton is running - #{Mix.env()}"
  end
end
