class Squares
  attr_reader :natural_numbers

  def initialize(count)
    @natural_numbers = 1.upto(count).to_a
  end

  def square_of_sums
    @square_of_sums ||= natural_numbers.inject(0, &:+) ** 2
  end

  def sum_of_squares
    @sum_of_squares ||= natural_numbers.inject do |result, number|
      result + (number ** 2)
    end
  end

  def difference
    @difference ||= square_of_sums - sum_of_squares
  end

end
