class OddWord
  def initialize(sentence)
    @sentence = sentence
  end

  def reverse
    idx = 0
    result = ""
    @sentence.scan(/\b[a-z0-9]+\b/i) do |word|
      result << "#{idx.odd? ? word.reverse : word} "
      idx += 1
    end
    result.chop << "."
  end
end

# Non-Bonus solution - first iteration
# class OddWord
#   def initialize(sentence)
#     @words = sentence.gsub(/\.\z/, "").split
#   end

#   def reverse
#     reversed_result = @words.map.with_index do |word, idx|
#       idx.odd? ? word.reverse : word
#     end
#     reversed_result.join(" ") << "."
#   end
# end
