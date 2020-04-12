defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  defguard vowel?(letter) when letter in ["a", "e", "i", "o", "u"]
  defguard consonant?(letter) when letter not in ["a", "e", "i", "o", "u"]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    Regex.split(~R/[[:space:]]+/u, phrase, trim: true)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map_join(" ", &transform/1)
  end

  defp transform(letters, suffix \\ [])

  defp transform(letters, suffix) do
    case letters do
      [first, second | _tail]
      when vowel?(first) or (first in ["x", "y"] and consonant?(second)) ->
        Enum.join([letters, suffix, "a", "y"])

      ["q", "u" | tail] ->
        transform(tail, suffix ++ ["q", "u"])

      [letter | tail] when consonant?(letter) ->
        transform(tail, suffix ++ [letter])
    end
  end
end
