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
    Regex.split(~R/[[:space:]]+/u, phrase, trim: true)
    |> Enum.map(&String.graphemes/1)
    |> Enum.map_join(" ", &transform/1)
  end

  defp transform(letters, result \\ [])
  defp transform([], result), do: Enum.join([result, "a", "y"])
  defp transform(["q", "u" | tail], result), do: transform(tail, [result, "q", "u"])

  defp transform([head | tail] = letters, result) when consonant?(head) do
    case tail do
      [second | _rest] when head in ["x", "y"] and consonant?(second) ->
        transform([], [letters, result])

      _ ->
        transform(tail, [result, head])
    end
  end

  defp transform(letters, result), do: transform([], [letters, result])
end
