defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number), do: template(number) |> Enum.join()

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0)
  def lyrics(range), do: Enum.map(range, &template/1) |> Enum.join("\n")

  defp template(number) do
    [
      String.capitalize(bottles(number)),
      " of beer on the wall, ",
      bottles(number),
      " of beer.\n",
      take_bottle_down(number),
      ", ",
      bottles(Integer.mod(number - 1, 100)),
      " of beer on the wall.\n"
    ]
  end

  defp bottles(0), do: "no more bottles"
  defp bottles(1), do: "1 bottle"
  defp bottles(number), do: "#{number} bottles"

  defp take_bottle_down(0), do: "Go to the store and buy some more"
  defp take_bottle_down(1), do: "Take it down and pass it around"
  defp take_bottle_down(number), do: "Take one down and pass it around"
end
