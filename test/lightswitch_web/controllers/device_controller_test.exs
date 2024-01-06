defmodule LightswitchWeb.DeviceControllerTest do
  use LightswitchWeb.ConnCase

  import Lightswitch.DevicesFixtures

  alias Lightswitch.Devices.Device

  @create_attrs %{
    alias: "some alias",
    devid: "some devid"
  }
  @update_attrs %{
    alias: "some updated alias",
    devid: "some updated devid"
  }
  @invalid_attrs %{alias: nil, devid: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all devices", %{conn: conn} do
      conn = get(conn, Routes.device_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create device" do
    test "renders device when data is valid", %{conn: conn} do
      conn = post(conn, Routes.device_path(conn, :create), device: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.device_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "alias" => "some alias",
               "devid" => "some devid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.device_path(conn, :create), device: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update device" do
    setup [:create_device]

    test "renders device when data is valid", %{conn: conn, device: %Device{id: id} = device} do
      conn = put(conn, Routes.device_path(conn, :update, device), device: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.device_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "alias" => "some updated alias",
               "devid" => "some updated devid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, device: device} do
      conn = put(conn, Routes.device_path(conn, :update, device), device: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete device" do
    setup [:create_device]

    test "deletes chosen device", %{conn: conn, device: device} do
      conn = delete(conn, Routes.device_path(conn, :delete, device))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.device_path(conn, :show, device))
      end
    end
  end

  defp create_device(_) do
    device = device_fixture()
    %{device: device}
  end
end
