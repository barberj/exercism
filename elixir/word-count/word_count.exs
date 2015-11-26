defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    map = %{}
    Enum.each(tokenize(sentence), fn word -> value = map[word]; Dict.put(map, word, value || 0 + 1) end)

    map
  end

  defp tokenize(sentence) do
    cleaned = Regex.replace(~r/[^A-Za-z0-9]+/, sentence, " ")
    stripped = String.strip(cleaned)
    normed = String.downcase(stripped)
    Regex.split(~r/[^a-z0-9]+/, normed)
  end
end
