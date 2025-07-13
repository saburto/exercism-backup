class Scrabble
  def initialize(args)
    @word = args.downcase.chars
  end

  def score
    @word
      .map do |e|
        case e
        when *%w[a e i o u l n r s t]
          1
        when *%w[d g]
          2
        when *%w[b c m p]
          3
        when *%w[f h v w y]
          4
        when *%w[k]
          5
        when *%w[j x]
          8
        when *%w[q z]
          10
        else
          0
        end
      end
      .sum
  end
end
