defmodule Teenager do
  def hey(input) do
    cond do
      String.strip(input) == "" -> "Fine. Be that way!"
      String.upcase(input) == input && String.downcase(input) != input -> "Whoa, chill out!"
      String.last(input) == "?" -> "Sure."
      true -> "Whatever."
    end
  end
end
