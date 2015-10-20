class Prime
  def self.nth(number)
    raise ArgumentError if number < 1
    count = 0
    possible = 1

    loop do
      possible += 1
      count    += 1 if is?(possible)
      break if count == number
    end

    possible
  end

  def self.divisor_bound(n)
    upper_bound = Math.sqrt(n)
    upper_bound = upper_bound + 1 if upper_bound.modulo(1) > 0
    upper_bound.to_i
  end

  def self.is?(n)
    n == 2 || (
      n % 2 != 0 &&
      (2..divisor_bound(n)).find do |i|
        n % i == 0
      end.nil?
    )
  end
end
