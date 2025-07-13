=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops

  def self.convert(num)

    out = []
    if num % 3 == 0
      out << "Pling"
    end

    if num % 5 == 0
      out << "Plang"
    end

    if num % 7 == 0
      out << "Plong"
    end

    return num.to_s if out.empty?

    out.join
  end

end

