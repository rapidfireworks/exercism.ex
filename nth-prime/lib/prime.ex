defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(1), do: 2
  def nth(2), do: 3
  def nth(count) when count > 2, do: nth(count, 6, -1)

  defp nth(count, base, offset) when count > 2 do
    count = if prime?(base + offset), do: count - 1, else: count
    base = if offset === 1, do: base + 6, else: base

    nth(count, base, -offset)
  end

  defp nth(_count, base, offset), do: base - offset - 6

  defp prime?(number) do
    trunc_sqrt = :math.sqrt(number) |> trunc()

    2..trunc_sqrt
    |> Enum.all?(&(rem(number, &1) !== 0))
  end
end
