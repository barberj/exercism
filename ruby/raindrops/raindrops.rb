class Raindrops
  def self.is_factor?(number, prime)
    (number % prime).zero?
  end

  def self.convert(number)
    output = ''.tap do |output|
      {
        3 => 'Pling',
        5 => 'Plang',
        7 => 'Plong'
      }.each do |prime, sound|
        output << sound if is_factor?(number, prime)
      end
    end

    output.size == 0 ? number.to_s : output
  end
end
