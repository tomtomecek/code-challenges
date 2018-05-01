module RunLengthEncoding
  def self.encode(input)
    input.gsub(/(.)\1+/) { |match| "#{match.size}#{match.chr}" }
  end

  def self.decode(input)
    input.gsub(/\d*\D/) { |match| match[-1] * match.to_i }
  end
end


# Manual solution without regexp
# class RunLengthEncoding
#   def self.encode(input)
#     output = ""
#     cached_char = ""
#     length = 0
#     input.each_char.with_index do |char, idx|
#       if cached_char != char
#         insert_char(output, cached_char, length)
#         length = 1
#         cached_char = char
#       else
#         length += 1
#       end

#       insert_char(output, cached_char, length) unless input[idx+1]
#     end
#     output
#   end

#   def self.decode(input)
#     output = ""
#     length = ""
#     input.each_char do |char|
#       if integer?(char)
#         length << char
#       else
#         output << char * (integer?(length) ? length.to_i : 1)
#         length = ""
#       end
#     end
#     output
#   end

# private
#   def self.integer?(char)
#     Integer(char) rescue nil
#   end

#   def self.insert_char(output, char, length)
#     output << length.to_s if length > 1
#     output << char        unless char.empty?
#   end
# end
