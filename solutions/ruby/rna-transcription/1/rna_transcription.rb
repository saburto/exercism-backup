# frozen_string_literal: true

# Solution
class Complement
  MAPPING = { 'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U'}

  def self.of_dna(dna)
    dna.strip.chars.map { |c| MAPPING[c] }.join("")
  end
end
