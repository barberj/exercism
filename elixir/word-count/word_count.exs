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
    cleaned = Regex.replace(~r/[^A-Za-z0-9]+/, sentence, " ")
    stripped = String.strip(cleaned)
    normed = String.downcase(stripped)
    Regex.split(~r/[^a-z0-9]+/, normed)
  end
end
