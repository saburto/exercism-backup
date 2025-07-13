class Sieve
  attr_reader :primes
  def initialize(number)
    range = number <= 1 ? [] : (2..number).to_a

    marked = []
    @primes = []

    range.each_with_index do |num, index|
      (num..number).each do |e|
        if e < number
          marked << e * num
        end
      end

      unless marked.include?(num)
        @primes << num
      end
    end
  end
end
