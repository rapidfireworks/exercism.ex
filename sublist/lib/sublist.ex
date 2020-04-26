defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(list, list), do: :equal
  def compare(left, right), do: compare(left, right, length(left), length(right))

  defp compare(left, right, left_length, right_length) when left_length > right_length do
    if sublist?(right, left, right_length, left_length), do: :superlist, else: :unequal
  end

  defp compare(left, right, left_length, right_length) do
    if sublist?(left, right, left_length, right_length), do: :sublist, else: :unequal
  end

  defp sublist?(sublist, superlist, sublist_size, superlist_size) do
    cond do
      sublist_size > superlist_size -> false
      start_with?(sublist, superlist) -> true
      true -> sublist?(sublist, tl(superlist), sublist_size, superlist_size - 1)
    end
  end

  defp start_with?([], _superlist), do: true
  defp start_with?(sublist, superlist) when hd(sublist) !== hd(superlist), do: false
  defp start_with?(sublist, superlist), do: start_with?(tl(sublist), tl(superlist))
end
