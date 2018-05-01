class PhoneNumber
  INVALID_NUMBER = "0000000000"
  attr_reader :number

  def initialize(raw_number_string)
    @number = clean raw_number_string
  end

  def area_code
    number[0, 3]
  end

  def to_s
    number.gsub(/(...)(...)(....)/, '(\1) \2-\3')
  end

private
  def valid?(num)
    num =~ /^\d{10}$/
  end

  def clean(string)
    result = string.gsub(/[^0-9a-z]/, "")
    result.slice!(0) if usa_number?(result)
    valid?(result) ? result : INVALID_NUMBER
  end

  def usa_number?(num)
    num =~ /^1\d{10}$/
  end
end
