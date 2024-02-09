defmodule Lab1.Repo.Migrations.CreateThirdTable do
  use Ecto.Migration

  def change do
    create table(:dogs) do
      add(:name, :string)
      add(:breed, :string)
      add(:color, :string)
      add(:date_of_birth, :utc_datetime_usec)
    end
  end
end
