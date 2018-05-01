require 'date'
class Meetup
  def initialize(month, year)
    @date = Date.new(year, month)
  end

  def day(weekday, schedule)
    schedules[schedule].detect {|date| date.send("#{weekday}?") }
  end

private
  def schedules
    { first:  @date...@date.next_day(7),
      second: @date.next_day(7)...@date.next_day(14),
      third:  @date.next_day(14)...@date.next_day(21),
      fourth: @date.next_day(21)...@date.next_day(28),
      last:   (@date.next_month - 7)...@date.next_month,
      teenth: @date.next_day(12)...@date.next_day(19) }
  end
end
