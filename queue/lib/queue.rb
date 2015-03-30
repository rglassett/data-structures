require_relative "../../linked_lists/lib/doubly_linked_list"

# Linked List implementation
class Queue
  def initialize
    @store = DoublyLinkedList.new
  end

  def enqueue(value)
    @store.push(value)
  end

  def dequeue
    raise "Queue is empty" unless @store.first_link
    @store.shift
  end

  def front
    @store.first_link.value
  end
end
