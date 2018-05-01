class Trinary
  BASE = 3

  def initialize(trinary)
    @digits = format_input(trinary).digits
  end

  def to_decimal
    @digits.map.with_index { |digit, idx|  BASE**idx * digit }.sum
  end

private

  def format_input(trinary)
    trinary =~ /[^0-2]/ ? 0 : trinary.to_i
  end
end
