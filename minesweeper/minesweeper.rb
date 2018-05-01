class ValueError < StandardError; end

class Board
  def self.transform(input)
    board = new(input)
    board.transform_to_new_board
  end

  def initialize(input)
    raise ValueError unless valid?(input)
    @board  = input
    @width  = @board[0].size
    @height = @board.size
  end

  def transform_to_new_board
    @board.each_with_index do |row, x|
      row.each_char.with_index do |value, y|
        new_board[x][y] = new_position_value(value, x, y)
      end
    end
    new_board.map(&:join)
  end

private
  def valid?(input)
    valid_length?(input) &&
      valid_horizontal_lines?(input) &&
      valid_vertical_lines?(input)
  end

  def valid_length?(input)
    input.all? { |line| line.size == input[0].size }
  end

  def valid_horizontal_lines?(input)
    pattern = /^\+-+\+$/
    input.first =~ pattern && input.last =~ pattern
  end

  def valid_vertical_lines?(input)
    lines = input.slice(1...-1)
    lines.all? { |line| line =~ /^\|(\ |\*)+\|$/ }
  end

  def new_position_value(value, x, y)
    value = adjacent_mines_count(x, y) if value == " "
    value = " " if value == 0
    value.to_s
  end

  def adjacent_mines_count(x, y)
    coordinates = near_fields_coordinates(x, y)
    fields = coordinates.map { |x, y| @board[x][y] }
    fields.count("*")
  end

  def near_fields_coordinates(x, y)
    all_possible = [*(x-1)..(x+1)].product [*(y-1)..(y+1)]
    all_possible.reject { |coordinates| coordinates == [x, y] }
  end

  def new_board
    @new_board ||= Array.new(@height) { Array.new(@width) }
  end
end
