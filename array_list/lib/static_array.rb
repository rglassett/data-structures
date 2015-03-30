class StaticArray
  def initialize(size = 0)
    @store = Array.new(size, nil)
  end

  def [](idx)
    @store[idx]
  end

  def []=(idx, value)
    @store[idx] = value
  end

  def inspect
    @store.inspect
  end
end
