defmodule MonologGateway.Mixfile do
  use Mix.Project

  def project do
    [
      app: :monolog_gateway,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [
        :exprotobuf,
        :kafka_ex,
        :snappy
      ],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:exprotobuf, "~> 1.2.9"},
      {:kafka_ex, "~> 0.8.0"},
      {:snappy, git: "https://github.com/fdmanana/snappy-erlang-nif"}
    ]
  end
end
