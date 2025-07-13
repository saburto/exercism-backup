=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end

class Game

  class BowlingError < StandardError
  end

  class Frame
    attr_accessor :first, :second, :third

    def score_without_third()
      (first || 0) + (second || 0)
    end

    def score()
      score_without_third + (third || 0)
    end

    def strike?
      (first || 0) == 10
    end

    def spare?
      !strike? && score == 10
    end

    def to_s
      "[#{first} | #{second} | #{third}]"
    end
  end

  def initialize()
    @pins = []
    @current_frame = Frame.new
  end

  def roll(pins)

    if pins > 10 || pins < 0
      raise BowlingError
    end

    if @pins.size == 10
      raise BowlingError
    end

    if @pins.size == 9
      if @current_frame.first
        if @current_frame.second

          if @current_frame.second < 10 && !@current_frame.spare? && @current_frame.second + pins > 10
            raise BowlingError
          end

          if @current_frame.spare? || @current_frame.first == 10
            @current_frame.third = pins
            @pins << @current_frame
            return
          end
          raise BowlingError
        end

        @current_frame.second = pins
        if @current_frame.first < 10 && @current_frame.first + pins > 10
          raise BowlingError
        end
        if @current_frame.first < 10 && !@current_frame.spare?
            @pins << @current_frame
        end
        return
      else
        @current_frame.first = pins
        return
      end
    end


    if @current_frame.first
      @current_frame.second = pins
      if @current_frame.first + pins > 10
        raise BowlingError
      end


      @pins << @current_frame
      @current_frame = Frame.new
      return
    end


    @current_frame.first = pins

    if pins == 10
      @pins << @current_frame
      @current_frame = Frame.new
      return
    end

  end

  def score()
    if @pins.size != 10
      raise BowlingError
    end
    puts @pins

    score = 0
    @pins.each_with_index do |e, i|
      if e.spare? && i < 9
        score += @pins[i+1].first if i + 1 < @pins.size
      end

      if e.strike? && i < 9
        score += @pins[i+1].score_without_third if i + 1 < @pins.size
        score += @pins[i+2].first if i + 2 < @pins.size && @pins[i+1].second.nil?
      end
      score += e.score
    end
    score
  end
end
