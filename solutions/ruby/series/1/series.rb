class Series
  def initialize(arr)
    @arr = arr.chars
  end

  def slices(num)
    if num > @arr.size || num <= 0
      raise ArgumentError
    end

    out = []
    @arr.size.times do |index|
      if index <= (@arr.size - num)
        out << @arr.slice(index, num).join
      end
    end

    out
  end
end
