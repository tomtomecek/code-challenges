class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @buffer      = Array.new(size)
    @read_index  = 0
    @write_index = 0
  end

  def read
    raise BufferEmptyException if empty?
    read_element = @buffer[@read_index]
    @buffer[@read_index] = nil
    increment_read_index
    read_element
  end

  def write(element)
    update_with_element(element) { raise BufferFullException }
  end

  def write!(element)
    update_with_element(element) { increment_read_index }
  end

  def clear
    @buffer.fill(nil)
  end

private
  def update_with_element(value)
    return if value.nil?

    yield if full? && block_given?
    @buffer[@write_index] = value
    increment_write_index
  end

  def full?
    @buffer.compact.size == @buffer.size
  end

  def empty?
    @buffer.compact.empty?
  end

  def increment_read_index
    @read_index += 1
    @read_index = 0 if @read_index == @buffer.size
  end

  def increment_write_index
    @write_index += 1
    @write_index = 0 if @write_index == @buffer.size
  end
end
