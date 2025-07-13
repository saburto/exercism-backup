class Cipher
  attr_reader :key
  RANGE = ("a".."z")
  SIZE = ("z".ord - "a".ord) + 1
  BASE = "a".ord

  def initialize(key = "aaaaaaaaaa")
    raise ArgumentError if key.empty?

    @key = key

    @dist = key.chars.map do |c|
      raise ArgumentError unless RANGE.include?(c)
      c.ord - "a".ord
    end
  end

  def encode(plain_text)
    process(plain_text) do |normal, dist|
      normal + dist
    end
  end

  def decode(plain_text)
    process(plain_text) do |normal, dist|
      normal - dist
    end
  end

  private

  def process(plain_text)
    out = ""
    plain_text.chars.each_with_index do |c, index|
      normalized = normalize_char(c)
      normalized = yield(normalized, @dist[index])
      out += to_char(normalized)
    end

    out
  end

  def normalize_char(c)
    c.ord - BASE
  end

  def to_char(normalized)
    (BASE + (normalized % SIZE)).chr
  end
end
