=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end
class Pangram
  def self.pangram?(sentence)
      letters = ('a'..'z').to_set
      sentence.downcase.each_char do |letter|
        letters.delete(letter)
      end

      letters.empty?
  end

end