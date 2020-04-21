defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size > 0, do: substrings(String.graphemes(s), size)
  def slices(_s, _size), do: []

  defp substrings(graphemes, size) when length(graphemes) < size, do: []

  defp substrings(graphemes, size) do
    [to_string(Enum.take(graphemes, size)) | substrings(tl(graphemes), size)]
  end
end
