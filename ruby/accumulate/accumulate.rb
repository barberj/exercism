module Enumerable
  def accumulate
    map { |a| yield(a) }
  end
end
