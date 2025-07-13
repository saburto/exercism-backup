class Squares

  attr_reader :square_of_sum, :sum_of_squares

  def initialize(args)
    @square_of_sum = Range.new(1, args).sum ** 2

    @sum_of_squares = Range.new(1, args).map { |x| x ** 2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
