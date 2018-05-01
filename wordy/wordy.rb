class WordProblem
  OPERATIONS = {
    "plus"       => :+,
    "minus"      => :-,
    "multiplied" => :*,
    "divided"    => :/
  }

  def initialize(sentence)
    @words = clean(sentence)
    raise ArgumentError if @words.size < 3
  end

  def answer
    while @words.any?
      result      ||= Integer(@words.shift)
      operation     = OPERATIONS[@words.shift]
      second_number = Integer(@words.shift)

      result = result.send(operation, second_number)
    end
    result
  end

private
  def clean(sentence)
    sentence.scan /-?\d+|plus|minus|multiplied|divided/
  end
end
