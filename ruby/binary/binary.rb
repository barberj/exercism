class Binary
  attr_reader :binary

  VERSION = 1

  def initialize(binary)
    raise ArgumentError unless binary.match(/^[01]+$/)
    @binary = binary
  end

  def to_decimal
    binary.to_i(2)
  end
end
