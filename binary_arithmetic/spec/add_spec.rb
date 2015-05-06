require 'rspec'
require 'add'

describe "#add" do
  describe "zero addition" do
    it "adds zero to zero" do
      expect(add(0, 0)).to eq(0)
    end

    it "adds zero to another number" do
      expect(add(0, 4)).to eq(4)
    end
  end

  describe "nonzero addition" do
    it "adds two numbers" do
      expect(add(2, 4)).to eq(6)
    end

    it "adds two other numbers" do
      expect(add(2, 3)).to eq(5)
    end

    it "adds larger numbers" do
      expect(add(10, 15)).to eq(25)
    end
  end
end
