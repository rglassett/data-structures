require 'rspec'
require 'linked_list'

describe Link do
  let(:empty_link) { Link.new }
  let(:non_empty_link) { Link.new("foo") }

  describe "#initialize" do
    context "when no value is given" do
      it "sets value to nil" do
        expect(empty_link.value).to be_nil
      end
    end

    context "when a value is given" do
      it "sets the value" do
        expect(non_empty_link.value).to eq("foo")
      end
    end
  end

  describe "#next" do
    it "returns nil before it is set" do
      expect(empty_link.next).to be_nil
    end

    it "sets the next link" do
      empty_link.next = non_empty_link

      expect(empty_link.next).to be(non_empty_link)
    end
  end
end

describe LinkedList do

end
