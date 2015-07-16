require "rspec"
require "stack_queue"

describe StackQueue do
  let(:empty_queue) { StackQueue.new }
  let(:stack) { Stack.new([1, 2, 3]) }
  let(:stack_queue) { StackQueue.new(stack) }

  describe "#dequeue" do
    it "returns the first-in element" do
      expect(stack_queue.dequeue).to eq(1)
    end

    it "dequeues elements in the correct order" do
      expect(stack_queue.dequeue).to eq(1)
      expect(stack_queue.dequeue).to eq(2)
      expect(stack_queue.dequeue).to eq(3)
    end
  end

  describe "#enqueue" do
    it "adds an element to an empty queue" do
      empty_queue.enqueue(5)

      expect(empty_queue.dequeue).to eq(5)
    end

    it "adds elements behind existing elements" do
      stack_queue.enqueue(5)

      3.times { stack_queue.dequeue }

      expect(stack_queue.dequeue).to eq(5)
    end
  end
end
