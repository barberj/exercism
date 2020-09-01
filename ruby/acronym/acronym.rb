class Acronym
  def self.abbreviate(phrase)
    phrase.scan(/\w+/).map { |p| p.chr.upcase }.join
  end
end
