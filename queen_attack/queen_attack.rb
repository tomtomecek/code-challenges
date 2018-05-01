class Queens
  class Queen < Struct.new(:x, :y); end

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = Queen.new(*white)
    @black = Queen.new(*black)
    @board = create_board
  end

  def white
    [@white.x, @white.y]
  end

  def black
    [@black.x, @black.y]
  end

  def to_s
    @board.map{ |fields| fields.join(" ") }.join("\n")
  end

  def attack?
    on_same_column? || on_same_row? || on_shared_diagonal?
  end

private
  def create_board
    Array.new(8) do |x|
      Array.new(8) { |y| label_field(x, y) }
    end
  end

  def label_field(*coordinates)
    case coordinates
    when white then "W"
    when black then "B"
    else            "_"
    end
  end

  def on_same_column?
    @white.y == @black.y
  end

  def on_same_row?
    @white.x == @black.x
  end

  def on_shared_diagonal?
    (@white.x - @black.x).abs == (@black.y - @white.y).abs
  end
end
