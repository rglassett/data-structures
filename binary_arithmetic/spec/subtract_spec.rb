require 'rspec'
require 'subtract'

describe "#subtract" do
  describe "zero subtraction" do
    it "subtracts zero from zero" do
      expect(subtract(0, 0)).to eq(0)
    end

    it "subtracts zero from another number" do
      expect(subtract(4, 0)).to eq(4)
    end
  end

  describe "nonzero subtraction" do
    it "subtracts two numbers" do
      expect(subtract(4, 2)).to eq(2)
    end

    it "subtracts two other numbers" do
      expect(subtract(3, 2)).to eq(1)
    end

    it "subtracts larger numbers" do
      expect(subtract(15, 10)).to eq(5)
    end
  end
end
