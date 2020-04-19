defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{ordinalize(number)} day of Christmas my true love gave to me: #{gift_set(number)}."
  end

  defp gift_set(1), do: gift(1)
  defp gift_set(2), do: "#{gift(2)}, and #{gift(1)}"
  defp gift_set(number), do: "#{gift(number)}, #{gift_set(number - 1)}"

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Enum.map_join(starting_verse..ending_verse, "\n", &verse/1)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing, do: verses(1, 12)

  defp ordinalize(1), do: "first"
  defp ordinalize(2), do: "second"
  defp ordinalize(3), do: "third"
  defp ordinalize(4), do: "fourth"
  defp ordinalize(5), do: "fifth"
  defp ordinalize(6), do: "sixth"
  defp ordinalize(7), do: "seventh"
  defp ordinalize(8), do: "eighth"
  defp ordinalize(9), do: "ninth"
  defp ordinalize(10), do: "tenth"
  defp ordinalize(11), do: "eleventh"
  defp ordinalize(12), do: "twelfth"

  defp gift(1), do: "a Partridge in a Pear Tree"
  defp gift(2), do: "two Turtle Doves"
  defp gift(3), do: "three French Hens"
  defp gift(4), do: "four Calling Birds"
  defp gift(5), do: "five Gold Rings"
  defp gift(6), do: "six Geese-a-Laying"
  defp gift(7), do: "seven Swans-a-Swimming"
  defp gift(8), do: "eight Maids-a-Milking"
  defp gift(9), do: "nine Ladies Dancing"
  defp gift(10), do: "ten Lords-a-Leaping"
  defp gift(11), do: "eleven Pipers Piping"
  defp gift(12), do: "twelve Drummers Drumming"
end
