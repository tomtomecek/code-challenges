class Prime
  def self.nth(nth_position)
    raise ArgumentError if nth_position.zero?
    return 2 if nth_position == 1
    primes = [2]
    number = 3

    until primes.size == nth_position
      primes << number if prime?(number, primes)
      number += 2
    end

    primes.last
  end

private
  def self.prime?(number, primes)
    primes.each do |prime|
      return true  if prime**2 > number
      return false if number % prime == 0
    end

    false
  end
end

# def nth_fibonacci(n)
#   fibs = [1, 1]
#   fibs << fibs[-2] + fibs[-1] while fibs.size < n
#   fibs.last
# end

# # 1,1,2,3,5,8,13,21,34
# p nth_fibonacci(5) == 5
# p nth_fibonacci(6) == 8
# p nth_fibonacci(8) == 21
# p nth_fibonacci(24) == 46_368
