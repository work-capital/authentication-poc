# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :security_test,
  ecto_repos: [SecurityTest.Repo]

# Configures the endpoint
config :security_test, SecurityTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KT3JOvah/HWwoI6bkuoySx/vq3j23e/dX6S+LN9ddYGZfBm5BPUnxiuaAujBzu7s",
  render_errors: [view: SecurityTest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SecurityTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "security_test",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: %{
    "k" => "_AbBL082GKlPjoY9o-KM78PhyALavJRtZXOW7D-ZyqE",
    "kty" => "oct"
  },
  serializer: SecurityTest.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
