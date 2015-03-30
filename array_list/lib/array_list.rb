require_relative './static_array'

class ArrayList
  attr_reader :length

  def initialize
    @capacity, @length = 8, 0
    @store = StaticArray.new(@capacity)
  end

  def [](idx)
    check_index(idx)
    @store[idx]
  end

  def []=(idx, value)
    check_index(idx)
    @store[idx] = value
  end

  def pop
    raise "index out of bounds" if @length == 0

    popped, @store[length - 1] = @store[@length - 1], nil
    @length -= 1

    popped
  end

  def push(value)
    @store[@length] = value
    @length += 1
    maybe_resize
  end

  def shift
    raise "index out of bounds" if @length == 0

    shifted = @store[0]
    (1...@length).each { |i| @store[i - 1] = @store[i] }
    @length -= 1

    shifted
  end

  def unshift(value)
    (@length - 1).downto(0) { |i| @store[i + 1] = @store[i] }

    @store[0] = value
    @length += 1

    maybe_resize
  end

  protected
    def check_index(idx)
      if idx < 0 || idx >= @length
        raise "index out of bounds"
      end
    end

    def maybe_resize
      resize! if @length == @capacity
    end

    def resize!
      @capacity *= 2
      old_store, @store = @store, StaticArray.new(@capacity)
      0.upto(@length) do |i|
        @store[i] = old_store[i]
      end
    end
  # end protected
end
