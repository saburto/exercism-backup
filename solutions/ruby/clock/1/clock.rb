class Clock
  attr_reader :hour, :minute
  def initialize(hour: 0, minute: 0)
    hour += adjust_hour_with_the_minutes(minute)

    @minute = minute % 60
    @hour = hour % 24
  end

  def to_s
    hour = "%02d" % @hour
    minute = "%02d" % @minute
    "#{hour}:#{minute}"
  end

  def +(other)
    Clock.new(hour: other.hour + @hour, minute: other.minute + @minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end

  private

  def adjust_hour_with_the_minutes(minute)
    return (minute / 60) if minute >= 60

    return -((minute.abs / 60) + 1) if minute < -60

    return -1 if minute < 0

    0
  end

end

