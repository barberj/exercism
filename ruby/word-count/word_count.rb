class Phrase
  VERSION = 1


  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @word_count ||= begin
      @words = phrase.split.map { |part| (part[/\w+/] || "").downcase }
      @words.reduce({}) do |count, word|
        if !word.empty?
          count[word] ||= 0
          count[word] += 1
        end
        count
      end
    end
  end

  private

  attr_reader :phrase
end
