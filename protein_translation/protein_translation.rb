class InvalidCodonError < StandardError; end

class Translation
  PROTEIN_CODONS = {
    "Methionine"    => %w(AUG),
    "Phenylalanine" => %w(UUU UUC),
    "Leucine"       => %w(UUA UUG),
    "Serine"        => %w(UCU UCC UCA UCG),
    "Tyrosine"      => %w(UAU UAC),
    "Cysteine"      => %w(UGU UGC),
    "Tryptophan"    => %w(UGG),
    "STOP"          => %w(UAA UAG UGA)
  }.freeze

  def self.of_codon(codon)
    PROTEIN_CODONS.each do |protein, codons|
      return protein if codons.include? codon
    end
    raise InvalidCodonError, "Invalid codon!"
  end

  def self.of_rna(strand)
    strand.scan(/.{3}/).each_with_object([]) do |codon, proteins|
      protein = of_codon(codon)
      return proteins if protein == "STOP"
      proteins << protein
    end
  end
end
