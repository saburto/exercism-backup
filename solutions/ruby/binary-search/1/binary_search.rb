class BinarySearch

  private attr_reader :nums

  def initialize(nums)
    @nums = nums.sort!
  end

  def search_for(value)
    return nil if nums.empty?
    do_search(0, nums.size, value)
  end

  def do_search(start, end_index, value)

    total = end_index - start
    if total == 1
      return start if nums[start] == value
      return nil
    end

    pivot_index = start + (total / 2)

    puts("pivot: #{pivot_index}, start: #{start}, end_index: #{end_index}")
    current = nums[pivot_index]

    if current == value
      return pivot_index
    end

    if value > current
      return do_search(pivot_index, end_index, value)
    end

    if value < current
      return do_search(start, pivot_index, value)
    end
  end

end
