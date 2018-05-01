class Clock
  DAY_HOURS    = 24
  HOUR_MINUTES = 60

  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hours   = hours
    @minutes = minutes
  end

  def to_s
    format("%02d:%02d", @hours, @minutes)
  end

  def +(total_minutes)
    hours, minutes = total_minutes.divmod(HOUR_MINUTES)
    @hours   = (@hours + hours) % DAY_HOURS
    @minutes += minutes
    self
  end

  def -(total_minutes)
    self.+(-total_minutes)
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end
end
