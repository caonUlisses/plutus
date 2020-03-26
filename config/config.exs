# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :plutus,
       ecto_repos: [Plutus.Repo]

# Configures the endpoint
config :plutus,
       PlutusWeb.Endpoint,
       url: [
         host: "localhost"
       ],
       secret_key_base: "YUTtgCQAJLCEe4qlgTpsTR8sZ8hhfuZnea+4PRiT3knIGd6nFEL7C5b/RcpZbe5I",
       render_errors: [
         view: PlutusWeb.ErrorView,
         accepts: ~w(json)
       ],
       pubsub: [
         name: Plutus.PubSub,
         adapter: Phoenix.PubSub.PG2
       ]

# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :plutus,
       Plutus.Guardian,
       issuer: "plutus",
       secret_key: "Sqo9zNbKNv0aRLV9yzogveQTRc87IgDukW0XYDGErs8tSDWn+J3aInjnZ65DbOBk"

config :money,
       default_currency: :BRL,
       separator: ".",
       delimiter: ","
