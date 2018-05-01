class SumOfMultiples
  def initialize(*numbers)
    @multiples = numbers
  end

  def self.to(limit)
    new(3, 5).to(limit)
  end

  def to(limit)
    (1...limit).sum { |num| multiple?(num) ? num : 0 }
  end

private
  def multiple?(num)
    @multiples.any? { |multiple| num % multiple == 0 }
  end
end
