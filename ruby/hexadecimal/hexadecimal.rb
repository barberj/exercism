=begin
Write your code for the 'Hexadecimal' exercise in this file. Make the tests in
`hexadecimal_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hexadecimal` directory.
=end

class Hexadecimal
  def to_decimal
    decimal = 0
    @parts.each_with_index do |p, i|
      n = decimal_value(p)
      decimal += n * (16**i)
    end
    decimal
  rescue
    0
  end

  private

  def is_number?(n)
    n.to_i.to_s == n
  end

  def decimal_value(n)
    return n.to_i if is_number?(n)

    case n.downcase
      when "a"
        10
      when "b"
        11
      when "c"
        12
      when "d"
        13
      when "e"
        14
      when "f"
        15
      else
        raise "Invalid"
    end
  end

  def initialize(input)
    @input = input
    @parts = input.split("").reverse
  end
end
