use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :security_test, SecurityTest.Endpoint,
  secret_key_base: "QP2El5+0I6DOAnOq3WcqQ8mFkENFsdrEQfTYZfkq8X+xzyEJWbyPsnIHTC8Uy8xK"

# Configure your database
config :security_test, SecurityTest.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "security_test_prod",
  pool_size: 20
