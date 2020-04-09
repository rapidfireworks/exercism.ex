defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    if size > 0 do
      to_charlist(s)
      |> substrings(size)
    else
      []
    end
  end

  defp substrings(letters, size) do
    if length(letters) < size do
      []
    else
      [to_string(Enum.take(letters, size)) | slices(Enum.drop(letters, 1), size)]
    end
  end
end
