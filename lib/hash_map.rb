require_relative './linked_list'

class MyHashMap
  attr_reader :size

  def initialize
    @buckets = [[]]
    @bucket_count = 1
    @size = 0
  end

  def add(key, value)
    raise "Can't add a key that already exists" if has_key?(key)

    @buckets[index(key)] << [key, value]
    @size += 1
    rehash if load_factor > 0.75
  end

  def delete(key)
    bucket = @buckets[index(key)]
    bucket.each_with_index do |(stored_key, value), idx|
      if stored_key == key
        @size -= 1
        bucket.delete_at(idx)
        return value
      end
    end
    nil
  end

  def get(key)
    pair = get_pair(key)
    pair && pair.last
  end

  def put(key, value)
    pair = get_pair(key)
    if pair
      pair[1] = value
    else
      add(key, value)
    end
  end

  def [](key)
    get(key)
  end

  def []=(key, value)
    put(key, value)
  end

  def each_pair
    @buckets.each do |bucket|
      bucket.each do |(key, value)|
        yield(key, value)
      end
    end
    self
  end

  def has_key?(key)
    !!get(key)
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      keys.concat(bucket.map(&:first))
    end
    keys
  end

  def values
    values = []
    @buckets.each do |bucket|
      values.concat(bucket.map(&:first))
    end
    values
  end

  def inspect
    pair_strings = []
    each_pair do |key, value|
      pair_strings << "#{key}: #{value}"
    end
    "{#{pair_strings.join(", ")}}"
  end

  private
    def get_pair(key)
      bucket = @buckets[index(key)]
      bucket.each do |pair|
        return pair if key == pair.first
      end
      nil
    end

    def index(key)
      key.hash % @bucket_count
    end

    def load_factor
      @size / @bucket_count
    end

    def rehash
      # TODO: rehash in place?
      old_buckets = @buckets
      @bucket_count *= 2
      @buckets = Array.new(@bucket_count) { [] }
      old_buckets.each do |bucket|
        bucket.each do |(key, value)|
          @buckets[index(key)] << [key, value]
        end
      end
    end
end
