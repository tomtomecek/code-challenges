class Sieve
  def initialize(limit)
    @limit = limit
    @sqrt_limit = Math.sqrt(limit)
    @numbers = (2..limit).to_a
  end

  def primes
    @numbers.each do |number|
      (number*2..@limit).step(number) do |composite|
        @numbers.delete(composite)
      end
    end
  end
end
