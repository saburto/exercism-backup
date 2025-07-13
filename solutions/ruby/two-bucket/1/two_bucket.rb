class TwoBucket

  attr_reader :other_bucket, :moves, :goal_bucket

  class Bucket
    attr_accessor :litters
    attr_reader :name, :size

    def initialize(size, name)
      @size = size
      @litters = 0
      @name = name
    end

    def filling
      @litters = @size
    end

    def capacity_lef
      @size - litters
    end

    def empty?
      litters.zero?
    end

    def full?
      litters == @size
    end

    def empty!
      @litters = 0
    end

    def receive(other)
      added = do_receive(other.litters)
      other.litters -= added
    end

    def do_receive(litters)
      new_litters = @litters + litters

      left = 0
      if capacity_lef < litters
        left = litters - capacity_lef
      end

      @litters = [@size, new_litters].min

      litters - left
    end

    def to_s
      return "#{@litters}"
    end
  end

  def initialize(bucket_size, other_bucket_size, desired_liters, first_bucket)
    if first_bucket == "one"
      @first_bucket = Bucket.new(bucket_size, "one")
      @second_bucket = Bucket.new(other_bucket_size, "two")
    else
      @first_bucket = Bucket.new(other_bucket_size, "two")
      @second_bucket = Bucket.new(bucket_size, "one")
    end

    @moves = 0

    while @first_bucket.litters != desired_liters && @second_bucket.litters != desired_liters
      @moves += 1
      if @first_bucket.empty?
        @first_bucket.filling
      elsif @second_bucket.empty? || @first_bucket.full?

        if @second_bucket.size == desired_liters
          @second_bucket.filling
        else
          @second_bucket.receive(@first_bucket)
        end

      elsif @second_bucket.full?
        @second_bucket.empty!
      end
    end

    if @first_bucket.litters == desired_liters
      @goal_bucket = @first_bucket.name
      @other_bucket = @second_bucket.litters
    else
      @goal_bucket = @second_bucket.name
      @other_bucket = @first_bucket.litters
    end
  end
end
