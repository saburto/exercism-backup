# frozen_string_literal: true

# Solution
class Diamond
  def self.make_diamond(letter)
    first_letter = letter.upcase[0]

    return "#{first_letter}\n" if first_letter == 'A'

    diff = first_letter.ord - 'A'.ord

    index = 'A'.ord

    line_length = (diff * 2) + 1

    top = (0..diff).map do |i|
      line = ' ' * line_length

      next_char = (index + i).chr

      line[diff + i] = next_char
      line[diff - i] = next_char

      line
    end

    bottom = (0...diff).reverse_each.map do |i|
      top[i]
    end

    [*top, *bottom, ''].join("\n")
  end
end
