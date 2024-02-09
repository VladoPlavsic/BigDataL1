# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :lab1,
  ecto_repos: [Lab1.Repo]

config :lab1, Lab1.Mongo,
  url: "mongodb://localhost:27017/lab1_dev",
  username: "lab1",
  password: "lab1",
  timeout: 60_000,
  idle_interval: 10_000,
  queue_target: 5_000

config :mongodb_driver,
  migration: [
    topology: :mongo,
    collection: "migrations",
    path: "migrations",
    otp_app: :lab1
  ]

# Configures the endpoint
config :lab1, Lab1Web.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: Lab1Web.ErrorHTML, json: Lab1Web.ErrorJSON],
    layout: false
  ],
  pubsub_server: Lab1.PubSub,
  live_view: [signing_salt: "CMYbtmyT"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.2.7",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
