class Phrase
  VERSION = 1


  def initialize(phrase)
    @phrase = phrase
  end

  def words
    @words ||= phrase.scan(%r{[a-zA-Z]+'{0,1}[a-zA-Z]+|[0-9]+}).map(&:downcase)
  end

  def reduce_words
    @reduced ||= words.reduce({}) do |count, word|
      count[word] ||= 0
      count[word] += 1
      count
    end
  end

  def word_count
    @word_count ||= reduce_words
  end

  private

  attr_reader :phrase
end
