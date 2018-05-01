class House
  def self.recite
    pieces.map.with_index(1) do |_, idx|
      build_verse idx
    end.join("\n")
  end

private
  def self.build_verse(idx)
    text = "This is"

    pieces.last(idx).each do |line|
      text << " #{line.join("\n")}"
    end

    "#{text}.\n"
  end

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
