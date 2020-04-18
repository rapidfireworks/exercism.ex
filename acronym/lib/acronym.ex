defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    ~R/([[:alpha:]])(?:[[:upper:]]+|[[:lower:]']*)[^[:alpha:]']*/
    |> Regex.replace(string, "\\1")
    |> String.upcase()
  end
end
