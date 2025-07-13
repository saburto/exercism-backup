class Clock
  attr_reader :hour, :minute
  def initialize(hour: 0, minute: 0)
    @minute = minute % 60
    @hour = (hour + minute / 60) % 24
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
end

