require 'rspec'
require 'doubly_linked_list'

describe DoublyLinkedList do
  let(:new_list) { LinkedList.new }
  let(:first_link) { DoubleLink.new("alpha") }
  let(:second_link) { DoubleLink.new("bravo") }

  before(:example) do
    new_list.first.insert_right(first_link)
    first_link.insert_right(second_link)
  end

  describe "sentinel links" do
    it "has sentinel links in the first and last positions" do
      expect(new_list.first).to be_a(SentinelLink)
      expect(new_list.last).to be_a(SentinelLink)
    end
  end

  describe "#pop" do
    it "returns the value of the last link in the list" do
      expect(new_list.pop).to eq(second_link.value)
    end

    # it "removes the popped link from the list" do
    #   new_list.pop
    #
    #   expect(new_list["two"]).to be nil
    # end
  end

  describe "#push" do
    it "adds a new link at the end of the list for the given key-value pair" do
      new_list.push("charlie")
      link = new_list.last.prev

      expect(link).to be_a(Link)
      expect(link.key).to eq("three")
      expect(link.value).to eq("charlie")
    end
  end

  describe "#shift" do
    it "returns the value of the first link in the list" do
      expect(new_list.shift).to eq(first_link.value)
    end

    it "removes the shifted link from the list" do
      new_list.shift

      expect(new_list["one"]).to be nil
    end
  end

  describe "#unshift" do
    it "adds a link to the beginning of the list" do
      new_list.unshift("three", "charlie")
      link = new_list.first.next

      expect(link).to be_a(Link)
      expect(link.key).to eq("three")
      expect(link.value).to eq("charlie")
    end
  end
end
