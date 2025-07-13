=begin
Write your code for the 'Circular Buffer' exercise in this file. Make the tests in
`circular_buffer_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/circular-buffer` directory.
=end
class CircularBuffer


  def initialize(capacity)
    @buffer = Array.new(capacity)
    @capacity = capacity

    @index_insert = 0

    @index_read = 0

    @size = 0
  end

  def write(arg)
    raise 'No nil for value' if arg.nil?

    if @size == @capacity
      raise BufferFullException
    end

    @buffer[@index_insert] = arg

    @index_insert = (@index_insert + 1) % @capacity

    @size += 1
  end

  def write!(arg)
    if @size == @capacity
      read
    end
    write(arg)
  end

  def clear()
    @buffer.fill(nil)
    @index_insert = 0
    @index_read = 0

    @size = 0
  end

  def read

    if @size == 0
      raise BufferEmptyException
    end

    out = @buffer[@index_read]

    @buffer[@index_read] = nil

    @index_read = (@index_read + 1) % @capacity

    @size -= 1

    raise 'No nil for read' if out.nil?
    out
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

end
