=begin
Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
`isbn_verifier_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isbn-verifier` directory.
=end
class IsbnVerifier

  ALLOW_CHARS = ((0..9).map { |d| d.to_s })

  def self.valid?(isbn)

    return false if isbn.gsub('-', '').size != 10
    total = 0
    index = 0
    isbn.chars.each do |e|
      next if e == '-'

      if e == 'X' && index == 9
        num = 10
      else
        if ALLOW_CHARS.include?(e)
          num = e.to_i
        else
          return false
        end
      end

      total += num * (10 - index)
      index += 1
    end

    total % 11 == 0
  end

end
