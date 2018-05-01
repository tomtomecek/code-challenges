class SecretHandshake
  COMMANDS = ["wink", "double blink", "close your eyes", "jump"]
  def initialize(input)
    @binary_string = if input.is_a? Integer
                       input.to_s(2) # use #to_binary if to_s is banned
                     elsif input =~ /[^01]/
                       "0"
                     else
                       input
                     end
  end

  def commands
    binary_digits = @binary_string.to_i.digits
    commands = COMMANDS.select.with_index do |_, idx|
      binary_digits[idx] == 1
    end
    binary_digits.size > COMMANDS.size ? commands.reverse : commands
  end

private
  def to_binary(decimal)
    digits = []
    until decimal.zero?
      decimal, remainder = decimal.divmod(2)
      digits << remainder
    end
    digits.reverse.join
  end
end
