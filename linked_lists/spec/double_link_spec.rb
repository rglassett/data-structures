require 'rspec'
require 'double_link'

describe DoubleLink do
  let(:link_one) { DoubleLink.new("alpha") }
  let(:link_two) { DoubleLink.new("bravo") }
  let(:link_three) { DoubleLink.new("charlie") }

  it "initializes with a value" do
    expect(link_one.value).to eq("alpha")
  end

  it "has pointers to the next and previous links" do
    expect(link_one).to respond_to(:prev)
    expect(link_one).to respond_to(:next)
  end

  describe "left insertion" do
    before(:example) do
      link_one.insert_left(link_two)
    end

    it "updates its own pointer" do
      expect(link_one.prev).to be(link_two)
    end

    it "updates the new link's pointer" do
      expect(link_two.next).to be(link_one)
    end
  end

  describe "right insertion" do
    before(:example) do
      link_one.insert_right(link_two)
    end

    it "updates its own pointer" do
      expect(link_one.next).to be(link_two)
    end

    it "updates the new link's pointer" do
      expect(link_two.prev).to be(link_one)
    end
  end

  describe "removal" do
    before(:example) do
      link_one.insert_left(link_two)
      link_one.insert_right(link_three)
      link_one.remove
    end

    it "updates the pointers of the next and previous links" do
      expect(link_two.next).to be(link_three)
      expect(link_three.prev).to be(link_two)
    end

    it "sets its own next and previous links to nil" do
      expect(link_one.next).to be_nil
      expect(link_one.prev).to be_nil
    end
  end
end
