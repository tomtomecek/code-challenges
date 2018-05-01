class Hex
  BASE = 16
  HEX_CONVERTER = [*"0".."9", *"A".."F"]

  def initialize(hex_string)
    @hex_digits = format_input(hex_string).reverse.chars
  end

  def to_decimal
    @hex_digits.map.with_index do |char, i|
      BASE**i * HEX_CONVERTER.index(char)
    end.sum
  end

private

  def format_input(hex_string)
    hex_string =~ /[\H]/ ? "0" : hex_string.upcase
  end
end