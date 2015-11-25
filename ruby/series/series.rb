require 'pry'
class Series
  VERSION = 1

  def initialize(digits)
    @digits = digits.split("").map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError if @digits.size < slice_size

    available = [].concat(@digits)

    [].tap do |slices|
      loop do
        break if available.size < slice_size
        slices << available.take(slice_size)
        available.shift
      end
    end
  end
end
