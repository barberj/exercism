class Squares
  attr_reader :count

  def initialize(count)
    @count = count
  end

  def square_of_sums
    @square_of_sums ||= 1.upto(count).inject(:+) ** 2
  end

  def sum_of_squares
    @sum_of_squares ||= 1.upto(count).inject do |result, number|
      result + (number ** 2)
    end
  end

  def difference
    @difference ||= square_of_sums - sum_of_squares
  end

end
