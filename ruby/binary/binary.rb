class Binary
  attr_reader :binary

  VERSION = 1

  def initialize(binary)
    @binary = binary
    raise ArgumentError unless binary.gsub('0', '').gsub('1', '').empty?
  end

  def to_decimal
    binary.to_i(2)
  end
end
