class Complement
  DNA_RNA_MAP = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  RNA_DNA_MAP = DNA_RNA_MAP.invert

  def self.find(nucleotides, map)
    nucleotides.
      chars.
      flat_map { |nucleotide| map.fetch(nucleotide) }.
      join
  rescue KeyError
    raise ArgumentError
  end

  def self.of_dna(nucleotides)
    find(nucleotides, DNA_RNA_MAP)
  end

  def self.of_rna(nucleotides)
    find(nucleotides, RNA_DNA_MAP)
  end
end
