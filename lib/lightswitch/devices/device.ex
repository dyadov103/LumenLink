defmodule Lightswitch.Devices.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "devices" do
    field :alias, :string
    field :devid, :string

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:alias, :devid])
    |> validate_required([:alias, :devid])
  end
end
