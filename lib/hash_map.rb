class MyHashMap
  def initialize
    @buckets = []
  end

  def [](key)
  end

  def []=(key, value)
  end

  def has_key?(key)
  end

  def keys
  end

  def values
  end

  private
    def index(key)
      key.hash % @store.length
    end
end
