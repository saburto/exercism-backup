class Atbash

  LETTERS = ("a".."z").to_a
  CYPHER = ("a".."z").to_a.reverse

  def self.encode(plain_text)
    plain_text
      .chars
      .map(&:downcase)
      .filter { |e| e.match?(/[a-z1-9]/) }
      .map do |e|
        if LETTERS.include?(e)
          CYPHER[LETTERS.index(e)]
        else
          e
        end
      end
      .each_slice(5)
      .map(&:join)
      .join(" ")
  end

  def self.decode(cipher_text)
    cipher_text
      .chars
      .map(&:downcase)
      .filter { |e| e.match?(/[a-z1-9]/) }
      .map do |e|
        if CYPHER.include?(e)
          LETTERS[CYPHER.index(e)]
        else
          e
        end
      end
      .join
  end
end
