class Phrase
  VERSION = 1


  def initialize(phrase)
    @phrase = phrase
  end

  def words
    @words ||= phrase.split(%r{[,\s*]}).map do |part|
      normed = (part[/\w+/] || "").downcase
      normed.empty? ? nil : normed
    end.compact
  end

  def reduce_words
    @reduced ||= words.reduce({}) do |count, word|
      if !word.empty?
        count[word] ||= 0
        count[word] += 1
      end
      count
    end
  end

  def word_count
    @word_count ||= reduce_words
  end

  private

  attr_reader :phrase
end
