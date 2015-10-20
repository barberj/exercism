class Robot
  ALPHA = ('A'..'Z').to_a
  NUMERIC = (1...10).to_a

  def name
    @name ||= begin
      (ALPHA.sample(2) + NUMERIC.sample(3)).join('')
    end
  end

  def reset
    @name = nil
  end
end
