defmodule IdotodosEx.Mixfile do
  use Mix.Project

  def project do
    [app: :idotodos_ex,
     version: "0.0.1",
     elixir: "~> 1.4.1",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],

     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {IdotodosEx, []},
     applications: [:sentry, :phoenix,:absinthe, :ex_machina, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext, :comeonin,
                    :phoenix_ecto,:timex, :postgrex, :ex_statsd, :spotify_ex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:atomic_map, "~> 0.8"},
      {:phoenix, "~> 1.2.1"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:csv, "~> 1.4.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:mix_test_watch, "~> 0.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:guardian, "~> 0.13.0"},
      {:comeonin, "~> 2.5"},
      {:timex, "~> 3.0"},
      {:timex_ecto, "~> 3.0"},
      {:ex_machina, "~> 2.0"},
      {:mailgun, "~> 0.1.2"},
      {:cowboy, "~> 1.0"},
      {:excoveralls, "~> 0.5", only: :test},
      {:distillery, "~> 0.10.1"},
      {:credo, ">=0.0.2", only: :dev},
      {:molasses, "~> 0.3.0"},
      {:poison, ">= 2.0.0", override: true},
      {:mustache, "~> 0.0.2"},
      {:html_sanitize_ex, "~> 1.0.0"},
      {:ex_statsd, ">= 0.5.1"},
      {:sentry, "~> 2.0"}, # Sentry error tracking
      {:basic_auth, "~> 2.0.0"},
      {:plug, "~> 1.3.0", override: true},
      {:spotify_ex, "~> 2.0.5"},
      {:absinthe, "~> 1.3.0-rc.0"},
      {:absinthe_plug, "~> 1.3.0-rc.0"},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
