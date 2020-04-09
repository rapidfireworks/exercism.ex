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

  defp encode(letter, shift) when letter in ?a..?z, do: ?a + clamp(letter - ?a + shift)
  defp encode(letter, shift) when letter in ?A..?Z, do: ?A + clamp(letter - ?A + shift)
  defp encode(letter, _shift), do: letter

  defp clamp(shift) do
    if shift < 0 do
      rem(shift, @alphabet_count) + @alphabet_count
    else
      rem(shift, @alphabet_count)
    end
  end
end
