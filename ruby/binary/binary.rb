class Binary
  attr_reader :binary

  VERSION = 1

  def initialize(binary)
    raise ArgumentError unless binary.match(/^[01]+$/)
    @binary = binary
  end

  def to_decimal
    binary.chars.reverse.each_with_index.reduce(0) do |sum, a |
      value, index = a[0], a[1]
      sum + (value.to_i * (2 ** index))
    end
  end
end
