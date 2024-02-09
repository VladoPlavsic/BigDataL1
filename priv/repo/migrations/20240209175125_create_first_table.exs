defmodule Lab1.Repo.Migrations.CreateFirstTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:first_name, :string)
      add(:last_name, :string)
      add(:username, :string)
      add(:email, :string)
      add(:description, :string)
    end
  end
end
