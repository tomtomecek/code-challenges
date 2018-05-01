class Series
  def initialize(string)
    @numbers = string.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if @numbers.size < size
    @numbers.each_cons(size).to_a
  end
end
