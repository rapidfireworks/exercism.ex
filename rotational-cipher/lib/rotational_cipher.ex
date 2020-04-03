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
    |> Enum.map(&rotate_letter(&1, shift))
    |> to_string
  end

  def rotate_letter(letter, shift) when letter in ?a..?z, do: ?a + clamp(letter - ?a + shift)
  def rotate_letter(letter, shift) when letter in ?A..?Z, do: ?A + clamp(letter - ?A + shift)
  def rotate_letter(letter, shift), do: letter

  def clamp(offset) do
    if offset < 0 do
      rem(offset, @alphabet_count) + @alphabet_count
    else
      rem(offset, @alphabet_count)
    end
  end
end
