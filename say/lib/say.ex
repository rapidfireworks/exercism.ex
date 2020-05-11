defmodule Say do
  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) when number in 0..999_999_999_999, do: {:ok, say(number)}
  def in_english(_number), do: {:error, "number is out of range"}

  defp say(number), do: say(number, 0) |> Enum.join()

  defp say(number, exponent) do
    quotient = div(number, 1000)
    remainder = rem(number, 1000)

    case {quotient > 0, remainder > 0} do
      {true, true} -> [say(quotient, exponent + 1), " ", convert(remainder), unit(exponent)]
      {true, false} -> [say(quotient, exponent + 1)]
      _ -> [convert(remainder), unit(exponent)]
    end
  end

  defp convert(number) do
    quotient = div(number, 100)
    remainder = rem(number, 100)

    convert(quotient, div(remainder, 10), rem(remainder, 10))
  end

  defp convert(0, 0, 0), do: "zero"
  defp convert(0, 0, 1), do: "one"
  defp convert(0, 0, 2), do: "two"
  defp convert(0, 0, 3), do: "three"
  defp convert(0, 0, 4), do: "four"
  defp convert(0, 0, 5), do: "five"
  defp convert(0, 0, 6), do: "six"
  defp convert(0, 0, 7), do: "seven"
  defp convert(0, 0, 8), do: "eight"
  defp convert(0, 0, 9), do: "nine"
  defp convert(0, 1, 0), do: "ten"
  defp convert(0, 1, 1), do: "eleven"
  defp convert(0, 1, 2), do: "twelve"
  defp convert(0, 1, 3), do: "thirteen"
  defp convert(0, 1, 4), do: "fourteen"
  defp convert(0, 1, 5), do: "fifteen"
  defp convert(0, 1, 6), do: "sixteen"
  defp convert(0, 1, 7), do: "seventeen"
  defp convert(0, 1, 8), do: "eighteen"
  defp convert(0, 1, 9), do: "ninteen"
  defp convert(0, 2, 0), do: "twenty"
  defp convert(0, 3, 0), do: "thirty"
  defp convert(0, 4, 0), do: "forty"
  defp convert(0, 5, 0), do: "fifty"
  defp convert(0, 6, 0), do: "sixty"
  defp convert(0, 7, 0), do: "seventy"
  defp convert(0, 8, 0), do: "eighty"
  defp convert(0, 9, 0), do: "ninty"
  defp convert(0, t, o), do: [convert(0, t, 0), "-", convert(0, 0, o)]
  defp convert(h, 0, 0), do: [convert(0, 0, h), " hundred"]
  defp convert(h, t, o), do: [convert(0, 0, h), " hundred ", convert(0, t, o)]

  defp unit(0), do: ""
  defp unit(1), do: " thousand"
  defp unit(2), do: " million"
  defp unit(3), do: " billion"
  defp unit(4), do: " trillion"
end
