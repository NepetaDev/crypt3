defmodule Mix.Tasks.Compile.Nif do
  def run(_args) do
    {result, _errcode} = System.cmd("make", [])
    IO.binwrite(result)
  end
end

defmodule Crypt3.Mixfile do
  use Mix.Project

  def project do
    [
      app: :crypt3,
      compilers: [:nif] ++ Mix.compilers,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      source_url: "https://github.com/ominousness/crypt3"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp package do
    [
      files: ["lib", "c_src", "mix.exs", "README.md", "Makefile", "LICENSE", "config", "test"],
      maintainers: ["Ominousness"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ominousness/crypt3"}
    ]
  end
end
