class Hamming
  VERSION = 1

  def self.compute(strand_a, strand_b)
    raise ArgumentError if strand_a.size != strand_b.size
    strand_a.chars.zip(strand_b.chars).count { |na1, na2| na1 != na2 }
  end
end
