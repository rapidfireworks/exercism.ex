defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base = String.downcase(base)

    candidates
    |> Enum.filter(&anagram?(base, &1))
  end

  defp anagram?(base, candidate) do
    candidate = String.downcase(candidate)

    !String.equivalent?(base, candidate) and
      Map.equal?(histogram(base), histogram(candidate))
  end

  defp histogram(word) do
    String.graphemes(word)
    |> Enum.frequencies()
  end
end
