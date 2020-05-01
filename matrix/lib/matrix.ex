defmodule Matrix do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input), do: %Matrix{matrix: parse_rows(input)}

  defp parse_rows(input) do
    String.split(input, "\n", trim: true)
    |> Enum.map(&parse_row/1)
  end

  defp parse_row(input) do
    Regex.split(~R/[[:space:]]+/u, input, trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    rows(matrix)
    |> Enum.map(&Enum.join(&1, " "))
    |> Enum.join("\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(%Matrix{matrix: rows}), do: rows

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index), do: rows(matrix) |> Enum.at(index)

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix), do: rows(matrix) |> transpose()

  defp transpose([]), do: []

  defp transpose(rows) do
    if Enum.any?(rows, &Enum.empty?/1) do
      []
    else
      rest = Enum.map(rows, &tl/1)
      [column_at(rows, 0) | transpose(rest)]
    end
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index), do: rows(matrix) |> column_at(index)
  defp column_at(rows, index), do: rows |> Enum.map(&Enum.at(&1, index))
end
