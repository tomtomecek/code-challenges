# Write a palindrom
# - cant use regex
# - cant use reverse method
# - case insensitive
# - ignore non-letters no1,3on is palindrome

def pure_letter(char)
  ('a'..'z').cover?(char) ? char : ""
end

def palindrome?(string)
  original = string.downcase.chars.map { |char| pure_letter(char) }
  reversed = original.map.with_index { |_, idx| original[-(idx+1)] }

  reversed == original
end

p palindrome?("boon is a si noob") == true
p palindrome?("Madam") == true
p palindrome?("Otto") == true
p palindrome?("no1,3on") == true