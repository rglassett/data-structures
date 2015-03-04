require_relative './static_array'

class ArrayList
  def initialize
    @capacity = 1
    @logical_size = 0
    @store = StaticArray.new(@capacity)
  end

  def [](idx)
    @store[logical_index(idx)]
  end

  def []=(idx, value)
    @store[logical_index(idx)] = value
  end

  def <<(value)
    push(value)
  end

  def length
    @logical_size
  end

  def inspect
    return "[]" if @logical_size == 0
    result = ""
    0.upto(@logical_size) do |i|
      result << @store[i].to_s
      unless i == @logical_size - 1
        result << ", "
      end
    end
    "[#{result}]"
  end

  def push(value)
    @store[@logical_size] = value
    @logical_size += 1
    maybe_resize
  end

  def pop
    popped = @store[@logical_size]
    @store[@logical_size] = nil
    @logical_size -= 1
    popped
  end

  def shift
    shifted = @store[0]
    0.upto(@logical_size) do |i|
      @store[i] = @store[i + 1]
    end
    @store[@logical_size] = nil
    @logical_size -= 1
    shifted
  end

  def unshift(value)
    @logical_size.downto(0) do |i|
      @store[i + 1] = @store[i]
    end
    @store[0] = value
    @logical_size += 1
    maybe_resize
  end

  protected
    def out_of_range?(idx)
      idx >= @logical_size
    end

    def logical_index(idx)
      if idx >= 0
        idx % @logical_size
      else
        i = (idx * -1) % @logical_size
        @logical_size - i - 1
      end
    end

    def maybe_resize
      resize if @logical_size == @capacity
    end

    def resize
      @capacity *= 2
      old_store, @store = @store, StaticArray.new(@capacity)
      0.upto(@logical_size) do |i|
        @store[i] = old_store[i]
      end
    end
  # end protected
end
