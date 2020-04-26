defmodule Bob do
  def hey(input) do
    String.trim(input)
    |> respond()
  end

  defp respond(""), do: "Fine. Be that way!"

  defp respond(input) do
    if String.ends_with?(input, "?") do
      answer(input)
    else
      reply(input)
    end
  end

  defp answer(input) do
    if shout?(input) do
      "Calm down, I know what I'm doing!"
    else
      "Sure."
    end
  end

  defp reply(input) do
    if shout?(input) do
      "Whoa, chill out!"
    else
      "Whatever."
    end
  end

  defp shout?(input) do
    String.upcase(input) === input and String.downcase(input) !== input
  end
end
