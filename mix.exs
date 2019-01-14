defmodule MusicFeed.MixProject do
  use Mix.Project

  def project do
    [
      app: :music_feed,
      version: "0.9.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: "Small Elixir library to retrieve now playing data from various streaming music stations",
      deps: deps(),
      package: package(),

      # Docs
      name: "MusicFeed",
      source_url: "https://github.com/bhoggard/music_feed",
      homepage_url: "https://github.com/bhoggard/music_feed",
      docs: [
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :inets, :ssl]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 4.0"},
      {:exml, "~> 0.1.1"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
    ]
  end

  defp package() do
    [
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/bhoggard/music_feed"}
    ]
  end
end
