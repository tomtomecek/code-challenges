class DNA
  def initialize(original_dna)
    @original_nucleids = original_dna.chars
  end

  def hamming_distance(other_dna)
    @original_nucleids.each_with_index.reduce(0) do |distance, (char, idx)|
      return distance unless other_dna[idx]
      distance + (char != other_dna[idx] ? 1 : 0)
    end
  end
end
