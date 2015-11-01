class Bob
  VERSION = 1

  def hey(text)
    return 'Fine. Be that way!' if silence?(text)
    return 'Whoa, chill out!' if yelling?(text)
    return 'Sure.' if question?(text)
    'Whatever.'
  end

  private

  def yelling?(text)
    text.downcase != text and text.upcase == text
  end

  def silence?(text)
    text.gsub(' ','').empty?
  end

  def question?(text)
    text[-1] == '?'
  end
end
