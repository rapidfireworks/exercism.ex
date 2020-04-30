defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @alphabet_count Enum.to_list(?a..?z) |> length()

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    String.graphemes(sentence)
    |> Enum.reduce(%MapSet{}, &put_alphabet/2)
    |> MapSet.size() === @alphabet_count
  end

  defp put_alphabet(grapheme, letters) do
    case {String.upcase(grapheme), String.downcase(grapheme), byte_size(grapheme)} do
      {^grapheme, ^grapheme, _} -> letters
      {_, lower, 1} -> MapSet.put(letters, lower)
      _ -> letters
    end
  end
end
