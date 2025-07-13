=begin
Write your code for the 'Rotational Cipher' exercise in this file. Make the tests in
`rotational_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rotational-cipher` directory.
=end

class RotationalCipher

  PLAIN = ('a'..'z').to_a

  def self.rotate(char, number)
    return char if number == 0

    output = []

    char.chars.each do |e|

      unless PLAIN.include?(e.downcase)
        output << e
        next
      end

      index = ((e.downcase.ord - 97 ) + number) % 26

      if e.downcase == e
        output << PLAIN[index].downcase
      else
        output << PLAIN[index].upcase
      end

    end

    output.join
  end
end
