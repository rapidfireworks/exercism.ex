defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    String.upcase(word)
    |> String.graphemes()
    |> Enum.map(&point/1)
    |> Enum.sum()
  end

  defp point("A"), do: 1
  defp point("E"), do: 1
  defp point("I"), do: 1
  defp point("O"), do: 1
  defp point("U"), do: 1
  defp point("L"), do: 1
  defp point("N"), do: 1
  defp point("R"), do: 1
  defp point("S"), do: 1
  defp point("T"), do: 1
  defp point("D"), do: 2
  defp point("G"), do: 2
  defp point("B"), do: 3
  defp point("C"), do: 3
  defp point("M"), do: 3
  defp point("P"), do: 3
  defp point("F"), do: 4
  defp point("H"), do: 4
  defp point("V"), do: 4
  defp point("W"), do: 4
  defp point("Y"), do: 4
  defp point("K"), do: 5
  defp point("J"), do: 8
  defp point("X"), do: 8
  defp point("Q"), do: 10
  defp point("Z"), do: 10
  defp point(_grapheme), do: 0
end
