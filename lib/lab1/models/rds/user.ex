defmodule Lab1.Models.RDS.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:username, :string)
    field(:email, :string)
    field(:description, :string)
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, __schema__(:fields))
  end
end
