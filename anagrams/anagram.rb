class Anagram
  def initialize(string)
    @word         = string.downcase
    @letter_count = letter_count(@word)
  end

  def match(anagram_adepts)
    anagram_adepts.select { |adept| anagram?(adept.downcase) }
  end

private
  def anagram?(adept)
    return false if @word == adept
    letter_count(adept) == @letter_count
  end

  def letter_count(word)
    counter = Hash.new(0)

    word.chars.each do |char|
      counter[char] += 1
    end

    counter
  end
end
