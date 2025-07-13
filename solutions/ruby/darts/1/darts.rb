=begin
Write your code for the 'Darts' exercise in this file. Make the tests in
`darts_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/darts` directory.

=end
class Darts
  def initialize(x, y)
    @x = x
    @y = y
  end

  def score
    position = (@x ** 2).abs + (@y ** 2).abs

    if position <= 1**2
      return 10
    end

    if position <= 5**2
      return 5
    end

    if position <= 10**2
      return 1
    end

    return 0
  end
end
