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
  defguard consonant?(letter) when letter not in ["a", "e", "i", "o", "u"]

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    Regex.split(~R/\p{Z}+/, phrase)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&transform/1)
    |> Enum.map(&Enum.join([&1, "a", "y"]))
    |> Enum.join(" ")
  end

  defp transform(letters) do
    case letters do
      ["x", letter | _tail] when consonant?(letter) -> letters
      ["y", letter | _tail] when consonant?(letter) -> letters
      ["q", "u" | tail] -> transform(tail ++ ["q", "u"])
      [letter | tail] when consonant?(letter) -> transform(tail ++ [letter])
      _ -> letters
    end
  end
end
