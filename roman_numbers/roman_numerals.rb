ROMAN_NUMERAL_SIGNS = %w(I V X L C D M)

class Integer
  def to_roman
    result = ""

    digits.each_with_index do |digit, idx|
      result.prepend roman_numeral(digit, idx)
    end

    result
  end

private
  def roman_numeral(digit, idx)
    return "" if digit.zero?
    one, five, next_one = ROMAN_NUMERAL_SIGNS[idx * 2, 3]
    case digit
    when 1..3 then one*digit
    when 4    then one+five
    when 9    then one+next_one
    else           five+one*(digit-5)
    end
  end
end
