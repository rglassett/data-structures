# StackQueue
#
# Implement a queue using stacks. That is, write enqueue and dequeue using only
# push and pop operations.
#
# In terms of performance, enqueue should be O(1), but dequeue may be worst-case
# O(n). In terms of amortized time, dequeue should be O(1). Prove that your
# solution accomplishes this.

class Stack
  def initialize(store = [])
    @store = store
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(val)
    @store.push(val)
  end
end

class StackQueue
  def initialize(stack = Stack.new)
    @stack = stack
    @queue_stack = Stack.new
  end

  def enqueue(val)
    # O(1)
    @stack.push(val)
  end

  def dequeue
    if @queue_stack.empty?
      # if we haven't already reversed the stack, O(n). We only have to do this
      # once for every n dequeue operations, so it amortizes to O(1)
      queueify_stack
    end

    @queue_stack.pop
  end

  private
  def queueify_stack
    until @stack.empty?
      @queue_stack.push(@stack.pop)
    end
  end
end
