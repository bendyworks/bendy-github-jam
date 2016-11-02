# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bendy_game,
  ecto_repos: [BendyGame.Repo]

# Configures the endpoint
config :bendy_game, BendyGame.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wZZIsBB4CcWVtUjIY05ZEXw0FdfMZa04T0MiV8fNbtpwIRM00gv+lNX12jwybZBO",
  render_errors: [view: BendyGame.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BendyGame.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
