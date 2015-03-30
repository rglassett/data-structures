class BSTNode
  attr_reader :comparator, :key, :left, :right

  def initialize(key = nil, &comparator)
    comparator ||= Proc.new { |x, y| x <=> y }
    @comparator = comparator
    @key = key
    unless key.nil?
      @left = BSTNode.new(&comparator)
      @right = BSTNode.new(&comparator)
    end
  end

  def delete
  end

  def insert(new_key)
    if leaf?
      self.key = new_key
    else
      recursive_insert(new_key)
    end
  end

  def leaf?
    key.nil?
  end

  def recursive_insert(new_key)
    case comparator.call(new_key, key)
    when -1
      left.insert(new_key)
    when 1
      right.insert(new_key)
    end
  end

  def search
  end

  def key=(new_key)
    @key = new_key
    @left ||= BSTNode.new(&comparator)
    @right ||= BSTNode.new(&comparator)
  end
end

class BinarySearchTree
end
