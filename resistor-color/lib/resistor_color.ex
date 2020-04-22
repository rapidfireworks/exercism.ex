defmodule ResistorColor do
  @moduledoc false

  @colors [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
  ]

  @codes Enum.with_index(@colors) |> Map.new()

  @spec colors() :: list(String.t())
  def colors, do: @colors

  @spec code(String.t()) :: integer()
  def code(color), do: Map.fetch!(@codes, color)
end
