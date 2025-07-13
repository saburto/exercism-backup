=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix

  def initialize(matrix)
    rows = matrix.split("\n")
    @matrix = []
    rows.each  do |r|
      values = r.split(" ").map(&:to_i)
      @matrix.append(values)
    end
  end

  def row(num)
    @matrix[num - 1]
  end

  def column(num)
    @matrix.map { |r| r[num-1] }
  end


end
