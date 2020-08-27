class Acronym
  def self.abbreviate(phrase)
    phrase.split("-").map do |p|
      p.split(" ").map { |p| p.chr.upcase }
    end.join
  end
end
