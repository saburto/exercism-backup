=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
class Luhn
  def self.valid?(number)
    number = number.strip
    return false if number.size <= 1
    num = 0
    offset = 0
    number.chars.reverse.each_with_index do |c, index|
     if c == " "
        offset += 1
        next
      end
      unless c.match?(/[[:digit:]]/)
        return false
      end

      n = c.to_i
      dub = n
      
      if (index - offset) % 2 != 0
        dub *= 2
        if dub > 9
          dub -= 9
        end      
      end
      num += dub
    end

    num % 10 == 0
  end
end