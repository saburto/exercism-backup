class Cipher
  attr_reader :key
  ALLOW_LETTERS = ("a".."z").to_a
  LETTER_A = "a".ord

  TRANSFORM_DIRECTION = {
    ENCODE: 1,
    DECODE: -1
  }

  def initialize(key = "aaaaaaaaaa")
    raise ArgumentError, "Key can't be empty" if key.empty?

    @key = key
    @distances = calculate_distance_of_every_letter(key)
  end

  def encode(plain_text)
    transform(plain_text, TRANSFORM_DIRECTION[:ENCODE])
  end

  def decode(encoded_text)
    transform(encoded_text, TRANSFORM_DIRECTION[:DECODE])
  end

  private

  def calculate_distance_of_every_letter(key)
    key.chars.map do |key_letter|
      unless ALLOW_LETTERS.include?(key_letter)
        raise ArgumentError, "Key includes [#{key_letter}], but must include only [#{ALLOW_LETTERS}]"
      end

      key_letter.ord - LETTER_A
    end
  end

  def transform(text, transform_direction)
    transform_letters = text.chars.map.with_index do |text_letter, index|
      normalized_letter = text_letter.ord - LETTER_A
      transform_letter_ordinal = normalized_letter + (@distances[index] * transform_direction)

      to_letter(transform_letter_ordinal)
    end

    transform_letters.join
  end

  def to_letter(letter_ordinal)
    (LETTER_A + (letter_ordinal % ALLOW_LETTERS.length)).chr
  end
end
