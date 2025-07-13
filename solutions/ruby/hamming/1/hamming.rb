class Hamming
  def self.compute(seq_a, seq_b)

    if seq_a.size != seq_b.size
      raise ArgumentError
    end

    chars_a = seq_a.chars
    chars_b = seq_b.chars

    diff = 0

    chars_a.each_with_index do |c, i|
      diff += 1 if c != chars_b[i]
    end

    diff
  end
end
