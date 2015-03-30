class DoubleLink
  attr_accessor :key, :value, :next, :prev

  def initialize(value)
    @value = value
  end

  def insert_left(link)
    if link.next || link.prev
      raise "trying to insert a link that's not bare!"
    end

    link.next = self
    link.prev = self.prev
    self.prev.next = link if self.prev
    self.prev = link
  end

  def insert_right(link)
    if link.next || link.prev
      raise "trying to insert a link that's not bare!"
    end

    link.prev = self
    link.next = self.next
    self.next.prev = link if self.next
    self.next = link
  end

  def remove
    self.next.prev = self.prev unless self.next.nil?
    self.prev.next = self.next unless self.prev.nil?
    self.prev, self.next = nil, nil
  end

  def inspect
    "Link: #{value}"
  end
end

