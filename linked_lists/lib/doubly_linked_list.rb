require_relative './double_link'
require_relative './sentinel_link'

class DoublyLinkedList
  attr_reader :first, :last

  def initialize
    @first = SentinelLink.new(:first)
    @last = SentinelLink.new(:last)
    @first.insert_right(@last)
  end

  def empty?
    first.next == last
  end

  def pop
    pop_link.value
  end

  def pop_link
    raise "can't pop from list if empty!" if empty?
    link = last.prev
    link.remove
    link
  end

  def push(value)
    push_link(DoubleLink.new(value))
  end

  def push_link(link)
    last.insert_left(link)
    link
  end

  def shift
    shift_link.value
  end

  def shift_link
    raise "can't shift from list if empty!" if empty?
    link = first.next
    link.remove
    link
  end

  def unshift(value)
    unshift_link(DoubleLink.new(value))
  end

  def unshift_link(link)
    first.insert_right(link)
    link
  end
end
