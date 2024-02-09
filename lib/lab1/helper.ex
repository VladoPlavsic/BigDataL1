defmodule Lab1.Helper do
  @storages %{
    "rds" => :rds,
    "mongo" => :mongo
  }

  def translate_storage(storage) do
    Map.fetch!(@storages, storage)
  end
end
