class Phrase
  attr_reader :word_count
  def initialize(words)
    @word_count = counting(words.downcase)
  end

  def counting(words)
    out = {}
    words.scan(/[a-z0-9']+/).map { |w| w.gsub(/^'/, "").gsub(/'$/, "") }.reject(&:empty?).map do |w|
      out[w] = out.fetch(w, 0) + 1
    end

    out
  end
end
