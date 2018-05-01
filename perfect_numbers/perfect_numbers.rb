class PerfectNumber
  def self.classify(number)
    fail("Number has to be positive!") if number < 1

    summed_factors = factors(number).sum

    if summed_factors == number
      "perfect"
    elsif summed_factors < number
      "deficient"
    else
      "abundant"
    end
  end

private
  def self.factors(number)
    (1...number).select { |num| number % num == 0 }
  end
end
