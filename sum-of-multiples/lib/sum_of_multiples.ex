defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Stream.map(factors, &multiples(limit, &1))
    |> Enum.reduce(MapSet.new(), &MapSet.union/2)
    |> Enum.sum()
  end

  defp multiples(limit, factor) do
    Stream.iterate(factor, &(&1 + factor))
    |> Enum.take_while(&(&1 < limit))
    |> MapSet.new()
  end
end
