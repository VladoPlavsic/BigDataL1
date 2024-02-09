defmodule Lab1.Mongo do
  use Mongo.Repo,
    otp_app: :lab1,
    topology: :mongo
end
