defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.split(~R/[[:space:]]+/u, string, trim: true)
    |> Enum.map(&Regex.replace(~R/[^[:alpha:]]+/, &1, ""))
    |> Enum.map(&shorten/1)
    |> Enum.join()
  end

  defp shorten(letter) do
    cond do
      Regex.match?(~R/^[[:lower:]]/u, letter) -> String.at(letter, 0) |> String.upcase()
      Regex.match?(~R/^[[:upper:]]+$/u, letter) -> String.at(letter, 0)
      true -> Regex.replace(~R/[[:lower:]]+/u, letter, "")
    end
  end
end
