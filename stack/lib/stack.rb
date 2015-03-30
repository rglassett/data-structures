require_relative "../../linked_lists/lib/singly_linked_list"

# Linked List implementation
class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(value)
    link = Link.new(value)
    @store.insert_beginning(link)
  end

  def pop
    raise "Stack is empty" unless @store.first_link
    link = @store.first_link
    @store.remove_beginning
    link
  end
end

# Array implementation
class Stack
  def initialize
    @store = []
  end

  def push(value)
    @store << value
  end

  def pop
    raise "Stack is empty" if @store.empty?
    @store.pop
  end
end
