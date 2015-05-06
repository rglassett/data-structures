require 'rspec'
require 'divide'

describe "#divide" do
  describe "zero division" do
    it "raises an error" do
      expect { divide(1, 0) }.to raise_error
    end
  end

  describe "nonzero division" do
    it "divides a number by one" do
      expect(divide(4, 1)).to eq(4)
    end

    it "divides two other numbers" do
      expect(divide(2, 3)).to eq(0)
    end

    it "divides larger numbers" do
      expect(divide(99, 8)).to eq(12)
    end
  end
end
