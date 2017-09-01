defmodule Backpack.Mixfile do
  use Mix.Project

  def project do
    [
      app: :backpack,
      version: "0.3.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Conveniences for working with Elixir
    """
  end

  defp package do
    [name: :backpack,
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Imran Ismail"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/imranismail/backpack"}]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:calendar, "~> 0.17.2"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
