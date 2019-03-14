defmodule AliceHaha.Mixfile do
  use Mix.Project

  def project do
    [
      app: :alice_haha,
      version: "1.0.5",
      elixir: "~> 1.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:alice, "~> 0.3"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    """
    This handler will allow Alice to keep track of people laughing and reply with an image.

    A laugh is considered any of the following:

    `~r/\b([ha][ha]+|lo+l|lmf?ao|rofl|roflmao)\b/i`

    Examples:
    lol
    haha
    lmao
    rofl
    loooool
    ha
    hahahahahaha
    roflmao
    lmfao
    """
  end

  defp package do
    [
      files: ["lib", "config", "mix.exs", "README*"],
      maintainers: ["Tyler Clemens"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/tielur/alice_haha/",
        "Docs" => "https://github.com/tielur/alice_haha/"
      }
    ]
  end
end
