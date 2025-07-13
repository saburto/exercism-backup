=begin
Write your code for the 'Triangle' exercise in this file. Make the tests in
`triangle_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/triangle` directory.
=end
class Triangle
  def initialize(args)
    @first, @second, @third = args
  end

  def equilateral?
    return false unless is_valid?
    @first == @second || @second == @third
  end

  def scalene?
    return false unless is_valid?
    @first != @second && @second != @third && @third != @first
  end

  def isosceles?
    return false unless is_valid?
    @first == @second || @second == @third || @third == @first
  end

  def any_zero?
    @first.zero? || @second.zero? || @third.zero?
  end

  def is_valid?
    return false if any_zero?

    @first + @second >= @third &&
    @second + @third >= @first &&
    @first + @third >= @second
  end
end