defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    count(tokenize(sentence), %{})
  end

  defp count([], map) do
    map
  end

  defp count([token|tokens], map) do
    count(tokens, Dict.put(map, token, (map[token] || 0) + 1))
  end

  defp tokenize(sentence) do
    Regex.replace(~r/[^\d\p{L}-]/u, sentence, " ") |>
      String.strip |>
      String.downcase |>
      String.split
  end
end
