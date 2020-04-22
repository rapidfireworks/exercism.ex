defmodule Bob do
  def hey(input) do
    String.trim(input)
    |> respond()
  end

  defp respond(""), do: "Fine. Be that way!"

  defp respond(input) do
    if ask?(input) do
      answer(input)
    else
      reply(input)
    end
  end

  defp answer(input) do
    if yell?(input) do
      "Calm down, I know what I'm doing!"
    else
      "Sure."
    end
  end

  defp reply(input) do
    if yell?(input) do
      "Whoa, chill out!"
    else
      "Whatever."
    end
  end

  defp ask?(input), do: Regex.match?(~R/\?$/, input)
  defp yell?(input), do: !Regex.match?(~R/(^[^[:alpha:]]+$|[[:lower:]])/u, input)
end
