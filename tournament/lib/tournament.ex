defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    tally(%{}, input)
    |> Enum.sort(&compare_record/2)
    |> report()
  end

  defp tally(table, []), do: table

  defp tally(table, [head | tail]) do
    case Regex.run(~R/^([[:alnum:] ]+);([[:alnum:] ]+);(win|draw|loss)$/u, head) do
      [_match, lhs_team, rhs_team, result] ->
        update_table(table, lhs_team, result)
        |> update_table(rhs_team, toggle_result(result))
        |> tally(tail)

      _ ->
        tally(table, tail)
    end
  end

  defp update_table(table, team, result) do
    Map.put_new(table, team, {0, 0, 0, 0, 0})
    |> Map.update!(team, &update_record(&1, result))
  end

  defp toggle_result("win"), do: "loss"
  defp toggle_result("draw"), do: "draw"
  defp toggle_result("loss"), do: "win"

  defp update_record({mp, w, d, l, p}, "win"), do: {mp + 1, w + 1, d, l, p + 3}
  defp update_record({mp, w, d, l, p}, "draw"), do: {mp + 1, w, d + 1, l, p + 1}
  defp update_record({mp, w, d, l, p}, "loss"), do: {mp + 1, w, d, l + 1, p}

  defp compare_record({lhs_team, {_, _, _, _, lhs_point}}, {rhs_team, {_, _, _, _, rhs_point}}) do
    case {lhs_point, rhs_point} do
      {point, point} -> lhs_team <= rhs_team
      _ -> lhs_point >= rhs_point
    end
  end

  defp report(table) do
    [
      "Team                           | MP |  W |  D |  L |  P"
      | Enum.map(table, &interpolate/1)
    ]
    |> Enum.join("\n")
  end

  defp interpolate({team, {mp, w, d, l, p}}) do
    [
      String.pad_trailing(team, 30),
      " | ",
      pad_number(mp),
      " | ",
      pad_number(w),
      " | ",
      pad_number(d),
      " | ",
      pad_number(l),
      " | ",
      pad_number(p)
    ]
  end

  defp pad_number(number), do: to_string(number) |> String.pad_leading(2)
end
