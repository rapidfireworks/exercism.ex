defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string), do: Regex.replace(~R/(.)\1*/, string, &compress/2)

  defp compress(match, letter) do
    case String.length(match) do
      1 -> letter
      count when count > 1 -> "#{count}#{letter}"
    end
  end

  @spec decode(String.t()) :: String.t()
  def decode(string), do: Regex.replace(~R/([[:digit:]]*)([^[:digit:]])/u, string, &extract/3)

  defp extract(_match, "", letter), do: letter
  defp extract(_match, digits, letter) do
    case Integer.parse(digits) do
      {count, _tail} -> String.duplicate(letter, count)
    end
  end
end
