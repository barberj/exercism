class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    limit.times.select { |i| is_multiple?(i) }.reduce(:+)
  end

  def self.to(limit)
    new(3,5).to(limit)
  end

  private

  def is_multiple?(i)
    @multiples.find { |multiple| i % multiple == 0 }
  end
end
