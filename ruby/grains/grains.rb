class Grains
  class << self
    def square(number)
      2 ** (number - 1)
    end

    def total
      (1..64).reduce { |r, n| r + square(n) }
    end
  end
end
