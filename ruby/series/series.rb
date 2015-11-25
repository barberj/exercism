class Series
  VERSION = 1

  def initialize(digits)
    @digits = digits.split("").map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError if @digits.size < slice_size
    @digits.each_cons(slice_size).to_a
  end
end
