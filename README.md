# AliceHaha [![Hex Version](https://img.shields.io/hexpm/v/alice_haha.svg)](https://hex.pm/packages/alice_haha) [![Deps Status](https://beta.hexfaktor.org/badge/all/github/tielur/alice_haha.svg)](https://beta.hexfaktor.org/github/tielur/alice_haha) [![Hex Downloads](https://img.shields.io/hexpm/dt/alice_haha.svg)](https://hex.pm/packages/alice_haha) [![License: MIT](https://img.shields.io/hexpm/l/alice_haha.svg)](https://hex.pm/packages/alice_haha)

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


## Installation

If [available in Hex](https://hex.pm/packages/alice_haha), the package can be installed as:

  1. Add `alice_haha` to your list of dependencies in `mix.exs`:

    ```elixir
    defp deps do
       [
         {:websocket_client, github: "jeremyong/websocket_client"},
         {:alice, "~> 0.3"},
         {:alice_haha, "~> 1.0"}
       ]
    end
    ```

  2. Add the handler to your list of registered handlers in `mix.exs`:

    ```elixir
    def application do
      [applications: [:alice],
        mod: {
          Alice, [Alice.Handlers.Haha, ...]}]
    end
    ```

## Usage

Use `@alice help` for more information.