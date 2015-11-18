module Enumerable
  def accumulate
    [].tap do |accumulated|
      each { |a| accumulated << yield(a) }
    end
  end
end
