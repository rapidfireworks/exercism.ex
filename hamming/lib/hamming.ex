defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2), do: diff(strand1, strand2)

  defp diff(strand1, strand2, result \\ 0)
  defp diff([], [], result), do: {:ok, result}
  defp diff([], _strand, _result), do: {:error, "Lists must be the same length"}
  defp diff(_strand, [], _result), do: {:error, "Lists must be the same length"}
  defp diff([base | strand1], [base | strand2], result), do: diff(strand1, strand2, result)
  defp diff([_lhs | strand1], [_rhs | strand2], result), do: diff(strand1, strand2, result + 1)
end
