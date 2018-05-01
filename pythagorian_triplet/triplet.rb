class Triplet
  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def self.where(max_factor:, min_factor: 1, sum: nil)
    factors = (min_factor..max_factor).to_a
    factors.combination(3).each_with_object([]) do |abc, triplets|
      triplet = new(*abc)
      next if sum && triplet.sum != sum
      triplets << triplet if triplet.pythagorean?
    end
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end
end
