defmodule Lab1.Workflow.Dog do
  alias Lab1.Models.RDS.Dog
  alias Lab1.Repo

  def create(count \\ 1) do
    Enum.each(1..count, &do_create/1)
  end

  defp do_create(itteration) do
    itteration
    |> generate_attrs()
    |> Dog.changeset()
    |> Repo.insert()
  end

  defp generate_attrs(itteration) do
    %{
      name: "Dog_#{itteration}",
      breed: "DogsBreed_#{itteration}",
      color: "Color_#{itteration}",
      date_of_birth: DateTime.utc_now()
    }
  end
end
