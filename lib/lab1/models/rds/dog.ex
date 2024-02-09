defmodule Lab1.Models.RDS.Dog do
  use Ecto.Schema

  import Ecto.Changeset

  schema "dogs" do
    field(:name, :string)
    field(:color, :string)
    field(:breed, :string)
    field(:date_of_birth, :utc_datetime_usec)
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, __schema__(:fields))
  end
end
