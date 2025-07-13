class HighScores
  attr_reader :scores

  def initialize(numbers)
    @scores = numbers
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    if @scores.size >= 3
      @scores.sort[-3..].reverse
    else
      @scores.sort.reverse
    end
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end
