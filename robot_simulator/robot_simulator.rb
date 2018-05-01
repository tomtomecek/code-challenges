class Robot
  DIRECTIONS = %i(north east south west).freeze
  DIRECTIONS_LENGTH = DIRECTIONS.size
  RIGHT = 1
  LEFT  = -1

  def at(x, y)
    @x, @y = x, y
  end

  def coordinates
    [@x, @y]
  end

  def orient(new_direction)
    raise ArgumentError unless DIRECTIONS.include? new_direction
    @direction = new_direction
  end

  def bearing
    @direction
  end

  def turn_right
    orient new_direction_to(RIGHT)
  end

  def turn_left
    orient new_direction_to(LEFT)
  end

  def advance
    case @direction
    when :north then @y += 1
    when :east  then @x += 1
    when :south then @y -= 1
    when :west  then @x -= 1
    end
  end

private
  def direction_idx
    DIRECTIONS.index(@direction)
  end

  def new_direction_to(idx_increment)
    DIRECTIONS[(direction_idx + idx_increment) % DIRECTIONS_LENGTH]
  end
end

class Simulator
  INSTRUCTIONS_MAP = {"L" => :turn_left, "A" => :advance, "R" => :turn_right}
  def instructions(commands)
    commands.chars.map do |command|
      INSTRUCTIONS_MAP[command]
    end
  end

  def place(robot, options={})
    robot.at(options[:x], options[:y])
    robot.orient(options[:direction])
  end

  def evaluate(robot, commands)
    instructions(commands).each do |instruction|
      robot.send(instruction)
    end
  end
end
