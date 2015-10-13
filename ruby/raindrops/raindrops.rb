require 'prime'

class Raindrops
  def self.is_factor?(number, prime)
    number % prime == 0
  end

  def self.find_factors(number)
    return [number] if Prime.prime?(number)

    factor = Prime.first(7).find { |prime| is_factor?(number, prime) }

    if factor
      [factor].concat find_factors(number/factor)
    else
      []
    end
  end

  def self.convert(number)
    output = ''

    factors = find_factors(number)
    output << 'Pling' if factors.include? 3
    output << 'Plang' if factors.include? 5
    output << 'Plong' if factors.include? 7

    output.size == 0 ? number.to_s : output
  end
end
