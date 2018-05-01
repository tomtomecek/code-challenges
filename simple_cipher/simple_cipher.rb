class Cipher
  ALPHABET = ("a".."z").to_a.freeze
  ALPHABET_LENGTH = ALPHABET.length
  attr_reader :key, :key_size

  def initialize(key=default_key)
    raise ArgumentError unless key =~ /[a-z]+/
    @key = key
    @key_size = key.size
  end

  def encode(text)
    transform(text, with_shift_order: :+)
  end

  def decode(text)
    transform(text, with_shift_order: :-)
  end

private
  def default_key
    Array.new(100) { ('a'..'z').to_a.sample }.join
  end

  def transform(text, with_shift_order:)
    chars = text.chars
    chars.map.with_index do |char, idx|
      translate(char, idx, with_shift_order)
    end.join
  end

  def translate(char, idx, order)
    char_idx = ALPHABET.index(char)
    new_idx  = char_idx.send(order, shift_index(idx))
    ALPHABET[new_idx % ALPHABET_LENGTH]
  end

  def shift_index(idx)
    ALPHABET.index(key[idx % key_size])
  end
end
