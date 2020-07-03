defmodule Pulsar.MixProject do
  use Mix.Project

  def project do
    [
      app: :pulsar,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [
        pulsar: [
          version: "0.0.1",
          applications: [pulsar: :permanent]
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Pulsar.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:parent, "~> 0.9"},
      {:highlander, "~> 0.2"},
      {:libcluster, "~> 3.2"}
    ]
  end
end
