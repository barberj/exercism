class Binary
  attr_reader :binary

  VERSION = 1

  def initialize(binary)
    raise ArgumentError unless binary.match(/^[01]+$/)
    @binary = binary
  end

  def to_decimal
    binary.chars.reverse.each_with_index.reduce(0) do |sum, (value, index)|
      sum + (value.to_i * (2 ** index))
    end
  end
end
