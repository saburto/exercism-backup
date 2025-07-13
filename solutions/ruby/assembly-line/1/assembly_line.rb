class AssemblyLine

  PER_HOUR_SLOWEST = 221

  def initialize(speed)
    @speed = speed
    @success_rate = if speed >= 5 && speed <= 8
                      0.9
                    elsif speed == 9
                      0.8
                    elsif speed == 10
                      0.77
                    else
                      1
                    end
  end

  def production_rate_per_hour
    PER_HOUR_SLOWEST * @speed * @success_rate
  end

  def working_items_per_minute
    items = production_rate_per_hour / 60
    items.to_i
  end
end
