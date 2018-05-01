class PigLatin
  def self.translate(sentence)
    words = sentence.split
    result = words.map do |word|
      unless begins_with_vowel?(word)
        word.gsub!(/^([^aeiou]*qu|[^aeiou]+)([aeiou].+)$/, '\2\1')
      end
      word + "ay"
    end
    result.join(" ")
  end

private
  def self.begins_with_vowel?(word)
    word =~ /^[aeiou]|[xy][^aeiou]/
  end
end
