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
    if item.nil?
      return nil
    elsif @contents.size == @max_size
      @contents.shift
      write(item)
    else
      write(item)
    end
  end

  def clear
    @contents.clear
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end
