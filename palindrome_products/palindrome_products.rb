class Palindromes
  Palindrome = Struct.new(:value, :factors)
  attr_reader :numbers, :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @numbers = (min_factor..max_factor).to_a
    @palindromes = Hash.new { |hsh, key| hsh[key] = [] }
  end

  def generate
    numbers.repeated_combination(2) do |factors|
      product = factors.reduce(:*)
      if palindrome?(product)
        set_palindrome(:@largest, product, factors)
        set_palindrome(:@smallest, product, factors)
      end
    end
  end

private
  def palindrome?(number)
    string = number.to_s
    string == string.reverse
  end

  def set_palindrome(type, product, factors)
    palindrome = instance_variable_get(type)

    if !palindrome || palindrome.value.send(operation(type), product)
      instance_variable_set(type, Palindrome.new(product, [factors]))
    elsif palindrome.value == product
      palindrome.factors << factors
    end
  end

  def operation(type)
    type == :@largest ? :< : :>
  end
end
