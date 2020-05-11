defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers))

  defp search(numbers, key, index, count) when count > 0 do
    offset = div(count, 2)
    target_index = index + offset

    case elem(numbers, target_index) do
      ^key -> {:ok, target_index}
      number when key < number -> search(numbers, key, index, offset)
      number when key > number -> search(numbers, key, index + count - offset, offset)
    end
  end

  defp search(_numbers, _key, _index, _count), do: :not_found
end
