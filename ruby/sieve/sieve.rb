class Sieve
  attr_accessor :limit
  attr_accessor :numbers
  attr_accessor :marked

  def initialize(given_limit)
    @limit = given_limit
    @numbers = 2.upto(limit).to_a
    @marked = []
  end

  def primes
    2.upto(limit).each do |n|
      numbers.each do |number|
        next if marked.include?(number)
        marked << number if number != n && number % n == 0
      end
    end

    numbers - marked
  end
end
