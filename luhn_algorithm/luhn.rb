class Luhn
  attr_reader :digits

  def initialize(number)
    @digits = number.digits
  end

  def addends
    result = digits.map.with_index do |number, idx|
      if idx.odd?
        double = number*2
        double >= 10 ? double - 9 : double
      else
        number
      end
    end
    result.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum_remainder == 0
  end

  def self.create(number)
    draft_number = number * 10
    luhn = new(draft_number)
    correction = luhn.valid? ? 0 : (10 - luhn.checksum_remainder)
    draft_number + correction
  end

  def checksum_remainder
    checksum % 10
  end
end
