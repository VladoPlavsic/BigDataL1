defmodule Mongo.Migrations.Mongo.CreateFirstTable do
  def up() do
    # The `up` functions will be executed when running `mix mongo.migrate`
    #
    # indexes = [[key: [files_id: 1, n: 1], name: "files_n_index", unique: true]]
    # Mongo.create_indexes(:mongo, "my_collection", indexes)
  end

  def down() do
    # The `down` functions will be executed when running `mix mongo.drop`
    #
    # Mongo.drop_collection(:mongo, "my_collection")
  end
end
