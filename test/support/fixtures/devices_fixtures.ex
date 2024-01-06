defmodule Lightswitch.DevicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lightswitch.Devices` context.
  """

  @doc """
  Generate a device.
  """
  def device_fixture(attrs \\ %{}) do
    {:ok, device} =
      attrs
      |> Enum.into(%{
        alias: "some alias",
        devid: "some devid"
      })
      |> Lightswitch.Devices.create_device()

    device
  end
end
