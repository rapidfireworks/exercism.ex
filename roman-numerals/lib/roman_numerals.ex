defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(1), do: "I"
  def numeral(5), do: "V"
  def numeral(10), do: "X"
  def numeral(50), do: "L"
  def numeral(100), do: "C"
  def numeral(500), do: "D"
  def numeral(1000), do: "M"
  def numeral(number) when is_integer(number) do
    base = base(number)

    cond do
      number in 2..3 || number in 11..39 || number in 101..399 || number in 1001..3999 ->
        "#{numeral(base)}#{numeral(number - base)}"

      number in 6..8 || number in 51..89 || number in 501..899 ->
        "#{numeral(5 * base)}#{numeral(number - 5 * base)}"

      number in [4, 9] || number in 40..49 || number in 90..99 || number in 400..499 ||
          number in 900..999 ->
        "#{numeral(base)}#{numeral(number + base)}"
    end
  end

  defp base(number) do
    :math.log10(number)
    |> floor()
    |> pow10()
    |> trunc()
  end

  defp pow10(number), do: :math.pow(10, number)
end
