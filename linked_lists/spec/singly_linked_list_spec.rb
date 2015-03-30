require 'rspec'
require 'singly_linked_list'

describe LinkedList do
  let(:link_one) { Link.new("foo") }
  let(:link_two) { Link.new("bar") }
  let(:link_three) { Link.new("fizzbuzz") }

  let(:empty_list) { LinkedList.new }
  let(:non_empty_list) { LinkedList.new(link_one) }

  describe "#initialize" do
    context "when no first link is given" do
      it "sets the first link to nil" do
        expect(empty_list.first_link).to be_nil
      end
    end

    context "when a first link is given" do
      it "sets the first link" do
        expect(non_empty_list.first_link).to be(link_one)
      end
    end
  end

  describe "#insert_after" do
    it "updates the next link for the target link" do
      non_empty_list.insert_after(link_one, link_two)

      expect(link_one.next).to be(link_two)
    end
  end

  describe "#insert_beginning" do
    before(:each) do
      non_empty_list.insert_beginning(link_two)
    end

    it "updates the first link" do
      expect(non_empty_list.first_link).to be(link_two)
    end

    it "updates the value of next for the first link" do
      expect(non_empty_list.first_link.next).to be(link_one)
    end
  end

  describe "#remove_after" do
    before(:each) do
      non_empty_list.insert_after(link_one, link_two)
    end

    context "when removing the last link" do
      it "sets the target link's #next to nil" do
        non_empty_list.remove_after(link_one)

        expect(link_one.next).to be_nil
      end
    end

    context "when removing an intermediate link" do
      it "sets the target link's #next" do
        non_empty_list.insert_after(link_two, link_three)

        non_empty_list.remove_after(link_one)

        expect(link_one.next).to be(link_three)
      end
    end
  end

  describe "#remove_beginning" do
    context "when there is only one link" do
      it "sets the first link to nil" do
        non_empty_list.remove_beginning

        expect(non_empty_list.first_link).to be_nil
      end
    end

    context "when there are multiple links" do
      it "sets the first link to the former second link" do
        non_empty_list.insert_after(link_one, link_two)

        non_empty_list.remove_beginning

        expect(non_empty_list.first_link).to be(link_two)
      end
    end
  end
end
