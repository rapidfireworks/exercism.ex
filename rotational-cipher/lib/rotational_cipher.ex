defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @alphabet_count 26

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_charlist(text)
    |> Enum.map(&encode(&1, shift))
    |> to_string
  end

  defp encode(letter, shift) do
    cond do
      letter in ?a..?z -> ?a + Integer.mod(letter - ?a + shift, @alphabet_count)
      letter in ?A..?Z -> ?A + Integer.mod(letter - ?A + shift, @alphabet_count)
      true -> letter
    end
  end
end
