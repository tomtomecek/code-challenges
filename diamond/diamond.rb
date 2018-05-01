class Diamond
  def self.make_diamond(char)
    range = ("A"..char).to_a
    base_line = range.reverse.join.chop + range.join.prepend # e.g. "EDCBABCDE"

    top_lines = range.map { |ch| base_line.gsub(/[^#{ch}]/, " ") << "\n" }
    bottom_lines = top_lines[0...-1].reverse
    (top_lines + bottom_lines).join
  end
end


# Additional Challenge
# def generate_pattern(max)
#   width = (1..max).to_a.join.size

#   (1...max).each do |n|
#     puts (1..n).to_a.join.ljust(width, "*")
#   end
#   nil
# end
#
# generate_pattern(20)