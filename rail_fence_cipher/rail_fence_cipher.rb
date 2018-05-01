class RailFenceCipher
  def self.encode(input, rail_count)
    fence = Array.new(rail_count) { [] }
    osc   = Oscillator.new(rail_count)

    input.each_char.with_index do |char, i|
      fence[osc[i]] << char
    end
    fence.map(&:join).join
  end

  def self.decode(input, rail_count)
    size = input.size
    fence = Array.new(rail_count) { Array.new(size) }
    osc   = Oscillator.new(rail_count)

    size.times do |i|
      fence[osc[i]][i] = "?"
    end

    chars = input.chars
    fence.each do |rail|
      while rail.include? "?"
        rail[rail.index("?")] = chars.shift
      end
    end

    size.times.reduce("") do |result, i|
      result << fence[osc[i]][i]
    end
  end
end


class Oscillator
  def initialize(rails_count)
    @indexes = build_indexes(rails_count)
  end

  def [](i)
    @indexes[i % @indexes.size]
  end

private
  def build_indexes(rails_count)
    range = [*(0...rails_count)]
    range + range.reverse[1...-1]
  end
end