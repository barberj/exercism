Binary = Struct.new(:binary) do
  VERSION = 1

  def to_decimal
    raise ArgumentError unless binary.gsub('0', '').gsub('1', '').empty?
    binary.to_i(2)
  end
end
