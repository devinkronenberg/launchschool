class CircularBuffer
  def initialize(max_size)
    @max_size = max_size
    @contents = []
  end

  def read
    if @contents.empty?
      fail BufferEmptyException
    else
      @contents.shift
    end
  end

  def write(item)
    if @contents.size == @max_size
      fail BufferFullException
    else
      @contents << item unless item.nil?
    end
  end

  def write!(item)
    return if item.nil?
    @contents.shift if @contents.size == @max_size
    write(item)
  end

  def clear
    @contents.clear
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end
