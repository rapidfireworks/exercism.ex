defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    String.downcase(sentence)
    |> String.replace(~R/[^[:alpha:]]/u, "")
    |> String.graphemes()
    |> Enum.frequencies()
    |> Enum.all?(&(elem(&1, 1) === 1))
  end
end
