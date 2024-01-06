defmodule Lightswitch.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :alias, :string
      add :devid, :string

      timestamps()
    end
  end
end
