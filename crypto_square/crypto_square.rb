class Crypto
  attr_reader :normalize_plaintext

  def initialize(text)
    @normalize_plaintext = text.downcase.tr("^a-z0-9", "")
  end

  def size
    @size ||= Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    @segments ||= normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    transpose_segments.join
  end

  def normalize_ciphertext
    transpose_segments.join(" ")
  end

private
  def transpose_segments
    (0...size).map do |i|
      plaintext_segments.each_with_object("") do |segment, word|
        word << segment[i] if segment[i]
      end
    end
  end
end
