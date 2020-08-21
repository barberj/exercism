=begin
Write your code for the 'Trinary' exercise in this file. Make the tests in
`trinary_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/trinary` directory.
=end

class Trinary
  VALID_NUMBERS = ["0", "1", "2"]

  def to_decimal
    return 0 unless is_number(@n)

    decimal = 0
    @parts.each_with_index do |p, i|
      trinary = trinary_value(p)
      decimal += trinary * (3**i)
    end
    decimal
  end

  private

  def trinary_value(p)
    return 0 if ([p] & VALID_NUMBERS).empty?
    p.to_i
  end

  def is_number(p)
    p.to_i.to_s == p
  end

  def initialize(n)
    @n = n
    @parts = n.split("").reverse
  end
end
