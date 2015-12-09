require 'pry'
class PhoneNumber
  def initialize(number)
    @raw_number = number
    @area_code = "000"
    @part1 = "000"
    @part2 = "0000"

    normalize()
  end

  def number
    "#{area_code}#{@part1}#{@part2}"
  end

  def to_s
    "(#{area_code}) #{@part1}-#{@part2}"
  end

  def area_code
    @area_code
  end

  private

  def normalize
    return unless valid_number?
    @area_code = digits[0..2]
    @part1 = digits[3..5]
    @part2 = digits[6..-1]
  end

  def valid_number?
    @raw_number.match(/^[0-9\(\)\-\.\s]+$/) && valid_length?
  end

  def valid_length?
    digits.size == 10 || starts_with_one?
  end

  def digits
    @digits ||= @raw_number.gsub(/[\(\)\-\.\s]/, '')
  end

  def starts_with_one?
    return false if !(digits.size == 11 && digits[0] == "1")
    @digits = @digits[1..-1]
  end
end
