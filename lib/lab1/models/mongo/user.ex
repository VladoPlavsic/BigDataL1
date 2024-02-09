defmodule Lab1.Models.Mongo.User do
  use Mongo.Collection

  collection "users" do
    attribute(:first_name, String.t())
    attribute(:last_name, String.t())
    attribute(:username, String.t())
    attribute(:email, String.t())
    attribute(:description, String.t())
    timestamps()
  end

  def new(attrs) do
    Map.merge(__MODULE__.new(), attrs)
  end
end
