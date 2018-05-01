class Octal
  BASE = 8

  def initialize(octal)
    @digits = format(octal).digits
  end

  def to_decimal
    decimal_numbers = @digits.map.with_index do |digit, index|
      BASE**index * digit
    end
    decimal_numbers.reduce(:+)
  end

private
  def format(octal)
    octal =~ /\D|[8-9]/ ? 0 : octal.to_i
  end
end
