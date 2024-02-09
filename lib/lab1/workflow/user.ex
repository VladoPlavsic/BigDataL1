defmodule Lab1.Workflow.User do
  alias Lab1.Models.RDS.User, as: RDSUser
  alias Lab1.Models.Mongo.User, as: MongoUser
  alias Lab1.Mongo
  alias Lab1.Repo

  def create(count, :rds) do
    {uSec, _} = :timer.tc(Enum, :each, [1..count, &create_rds/1])
    uSec
  end

  def create(count, :mongo) do
    {uSec, _} = :timer.tc(Enum, :each, [1..count, &create_mongo/1])
    uSec
  end

  defp create_rds(itteration) do
    itteration
    |> generate_attrs()
    |> RDSUser.changeset()
    |> Repo.insert()
  end

  defp create_mongo(itteration) do
    itteration
    |> generate_attrs()
    |> MongoUser.new()
    |> Mongo.insert()
  end

  defp generate_attrs(itteration) do
    %{
      first_name: "Name_#{itteration}",
      last_name: "Family_#{itteration}",
      username: "username#{itteration}",
      email: "email#{itteration}@gmail.com",
      description: "Lorem ipsum #{itteration}"
    }
  end
end
