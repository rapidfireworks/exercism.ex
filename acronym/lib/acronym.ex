defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.split(~R/[\p{Z}-_]+/, string)
    |> Enum.map(&Regex.replace(~R/[^\p{L}]/, &1, ""))
    |> Enum.map(&shorten/1)
    |> Enum.join()
  end

  defp shorten(letter) do
    cond do
      Regex.match?(~R/^\p{Ll}/, letter) -> String.at(letter, 0) |> String.upcase()
      Regex.match?(~R/^\p{Lu}+$/, letter) -> String.at(letter, 0)
      true -> Regex.replace(~R/\p{Ll}/, letter, "")
    end
  end
end
