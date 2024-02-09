defmodule Lab1.Workflow.Cat do
  alias Lab1.Models.RDS.Cat
  alias Lab1.Repo

  def create(count \\ 1) do
    Enum.each(1..count, &do_create/1)
  end

  defp do_create(itteration) do
    itteration
    |> generate_attrs()
    |> Cat.changeset()
    |> Repo.insert()
  end

  defp generate_attrs(itteration) do
    %{
      name: "Cat_#{itteration}",
      breed: "CatsBreed_#{itteration}",
      color: "Color_#{itteration}",
      date_of_birth: DateTime.utc_now()
    }
  end
end
