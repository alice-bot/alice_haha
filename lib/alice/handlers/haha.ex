defmodule Alice.Handlers.Haha do
  @moduledoc """
  Alice haha

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
  LOL
  lol
  Lmfao
  lmao
  """
  use Alice.Router
  alias Alice.Conn

  route ~r/\b([ha][ha]+|lo+l|lmf?ao|rofl|roflmao)\b/i, :haha
  command ~r/>:? haha winners\z/i, :winners

  @doc "😂"
  def haha(conn) do
    conn
    |> get_state(:haha_count, 0)
    |> case do
      93 ->
        conn
        |> put_state(:haha_count, 0)
        |> update_winners()
        |> haha_reply()
      count -> put_state(conn, :haha_count, count + 1)
    end
  end

  @doc "`haha winners` - get the list of haha winners"
  def winners(conn) do
    sorted_winners(conn, &</2)
    |> reply(conn)
  end

  defp sorted_winners(conn, sort_func) do
    conn
    |> get_winners()
    |> Enum.sort_by(fn({_,wins}) -> wins end, sort_func)
    |> Enum.with_index(1)
    |> Enum.map(fn({{user_id,wins},n}) -> "#{n}. <@#{user_id}>: #{wins}" end)
    |> Enum.reverse()
    |> Kernel.++(["List of HAHA Winners"])
    |> Enum.reverse()
    |> Enum.join("\n")
  end

  defp get_winners(conn) do
    get_state(conn, :haha_winners, %{})
  end

  defp update_winners(conn) do
    put_state(conn, :haha_winners, updated_winners(conn))
  end

  defp updated_winners(%Conn{message: %{user: user_id}} = conn) do
    conn
    |> get_state(:haha_winners, %{})
    |> Map.merge(%{to_string(user_id) => 1}, fn _key, old_val, new_value -> old_val + new_value end)
  end

  defp haha_reply(conn) do
    conn
    |> delayed_reply(sorted_winners(conn, &</2), 1000)
    conn
    |> reply("https://s3.amazonaws.com/giphymedia/media/Ic97mPViHEG5O/giphy.gif")
  end
end
