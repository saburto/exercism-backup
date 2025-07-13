class InvalidCodonError < StandardError
end

class Translation

  def self.of_rna(strand)
    stop = false
    strand
      .chars
      .each_slice(3)
      .map(&:join)
      .map do |seq|
        next if stop

        case seq
        when "AUG"
          "Methionine"
        when "UUU", "UUC"
          "Phenylalanine"
        when "UUA", "UUG"
          "Leucine"
        when "UCU", "UCC", "UCA", "UCG"
          "Serine"
        when "UAU", "UAC"
          "Tyrosine"
        when "UGU", "UGC"
          "Cysteine"
        when "UGG"
          "Tryptophan"
        when "UAA", "UAG", "UGA"
          stop = true
          nil
        else
          raise InvalidCodonError
        end
      end
      .compact
  end

end
