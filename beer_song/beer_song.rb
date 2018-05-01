class BeerSong
  def initialize
    @lyrics_hash = Hash.new(:standard_version)
    @lyrics_hash.update(0 => :zero_version,
                        1 => :one_version,
                        2 => :two_version)
  end

  def verse(number)
    send(@lyrics_hash[number], number)
  end

  def verses(from, to)
    from.downto(to).map { |number| verse(number) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

private
  def standard_version(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{number-1} bottles of beer on the wall.\n"
  end

  def two_version(num)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def one_version(num)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def zero_version(num)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end
