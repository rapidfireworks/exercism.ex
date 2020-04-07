defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    sequence(code)
    |> Enum.filter(&bitwise_and(code, &1))
    |> Enum.map(&command/1)
  end

  defp sequence(code) do
    if bitwise_and(code, 16) do
      [8, 4, 2, 1]
    else
      [1, 2, 4, 8]
    end
  end

  defp command(1), do: "wink"
  defp command(2), do: "double blink"
  defp command(4), do: "close your eyes"
  defp command(8), do: "jump"

  defp bitwise_and(left, right), do: band(left, right) > 0
end
