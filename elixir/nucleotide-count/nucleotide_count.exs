defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]
  @histogram_map %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    case valid?([nucleotide|strand]) do
      false -> raise ArgumentError
      true -> count(strand, nucleotide, 0)
    end
  end

  defp valid?(nucleotides) do
    Enum.all?(nucleotides, &(valid_nucleotide?(&1)))
  end

  defp valid_nucleotide?(nucleotide) do
    Enum.member?(@nucleotides, nucleotide)
  end

  defp count([], _, count) do
    count
  end

  defp count([strand_nucleotide | strand], nucleotide, count) do
    count = cond do
      strand_nucleotide == nucleotide -> count + 1
      true                            -> count
    end

    count(strand, nucleotide, count)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    histogram(strand, @histogram_map)
  end

  defp histogram(strand, map) do
    Enum.reduce(strand, map, fn(nucleotide, map) -> histogram(strand, nucleotide, map) end)
  end

  defp histogram(strand, nucleotide, map) do
    count = count(strand, nucleotide)
    %{ map | nucleotide => count }
  end
end
