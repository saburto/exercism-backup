class ListOps
  def self.arrays(array)
    array.length
  end

  def self.reverser(array)
    array.reverse
  end

  def self.concatter(array_a, array_b)
    array_a + array_b
  end

  def self.mapper(array)
    array.map { |e| yield e }
  end

  def self.filterer(array)
    array.filter { |e| yield e }
  end

  def self.sum_reducer(array) = array.sum

  def self.factorial_reducer(array)
    array.reduce(1) { |e, acc| e * acc }
  end
end
