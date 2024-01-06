defmodule LightswitchWeb.DeviceView do
  use LightswitchWeb, :view
  alias LightswitchWeb.DeviceView

  def render("index.json", %{devices: devices}) do
    %{data: render_many(devices, DeviceView, "device.json")}
  end

  def render("show.json", %{device: device}) do
    %{data: render_one(device, DeviceView, "device.json")}
  end

  def render("device.json", %{device: device}) do
    %{
      id: device.id,
      alias: device.alias,
      devid: device.devid
    }
  end
end
