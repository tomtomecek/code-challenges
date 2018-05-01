class InvalidPinCountError < RuntimeError
  def message
    "Pins must have a value from 0 to #{Frame::PINS_TOTAL}"
  end
end

class ExceedLaneCountError < RuntimeError
  def message
    "Pin count exceeds pins on the lane"
  end
end

class GameNotOverError < RuntimeError
  def message
    "Game is not yet over, cannot score!"
  end
end

class RollsAfterGameOverError < RuntimeError
  def message
    "Should not be able to roll after game is over"
  end
end

class NotYetScoreError < RuntimeError
  def message
    "Score cannot be taken until the end of the game"
  end
end

class Frame
  PINS_TOTAL = 10
  def initialize
    @rolls  = []
  end

  def enter_roll_result(pins)
    raise InvalidPinCountError unless valid_pin_count?(pins)
    @rolls << pins
    raise ExceedLaneCountError if exceeds_lane_count?
  end

  def finished?
    if @fill_ball
      rolls.size == 3
    else
      strike? || rolls.size == 2
    end
  end

  def fill_ball!
    @fill_ball = true
  end

  def score(next1, next2)
    rolls = @rolls + Array(next1&.rolls) + Array(next2&.rolls)
    roll_count = (strike? || spare?) ? 3 : 2
    rolls.take(roll_count).sum
  end

  def fill_ball_time?
    @last && (strike? || spare?)
  end

  def last!
    @last = true
  end

protected
  attr_reader :rolls

private
  def exceeds_lane_count?
    if fill_ball_time?
      if finished? && rolls[1] != PINS_TOTAL
        rolls.last(2).sum > PINS_TOTAL
      end
    else
      rolls.sum > PINS_TOTAL
    end
  end

  def valid_pin_count?(pins)
    (0..PINS_TOTAL).cover?(pins)
  end

  def strike?
    rolls.first == PINS_TOTAL
  end

  def spare?
    rolls.first(2).sum == PINS_TOTAL
  end
end

class Game
  FRAMES_TOTAL = 10
  def initialize
    @frames = [Frame.new]
  end

  def roll(pins)
    raise RollsAfterGameOverError if game_over?

    start_new_frame if last_frame.finished?
    last_frame.enter_roll_result(pins)
    last_frame.fill_ball! if last_frame.fill_ball_time?
  end

  def score
    raise GameNotOverError unless game_over?
    raise NotYetScoreError unless last_frame.finished?

    @frames.each_with_index.sum do |(frame, i)|
      frame.score(@frames[i + 1], @frames[i + 2])
    end
  end

private
  def game_limit?
    @frames.size == FRAMES_TOTAL
  end

  def last_frame
    @frames.last
  end

  def game_over?
    game_limit? && last_frame.finished?
  end

  def start_new_frame
    @frames << Frame.new
    last_frame.last! if game_limit?
  end
end
