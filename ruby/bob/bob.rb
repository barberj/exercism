class Bob
  VERSION = 1

  def hey(text)
    return 'Fine. Be that way!' if silence?(text)
    return 'Whoa, chill out!' if yelling?(text)
    'Sure.'
    'Whatever.'
  end

  private

  def yelling?(text)
    text.upcase == text
  end

  def silence?(text)
    text.gsub(' ','').empty?
  end
end
