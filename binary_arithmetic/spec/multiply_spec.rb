require 'rspec'
require 'multiply'

describe "#multiply" do
  describe "zero multiplication" do
    it "multiplies zero by zero" do
      expect(multiply(0, 0)).to eq(0)
    end

    it "multiplies zero by another number" do
      expect(multiply(0, 4)).to eq(0)
    end
  end

  describe "nonzero multiplication" do
    it "multiplies a number by one" do
      expect(multiply(1, 4)).to eq(4)
    end

    it "multiplies two other numbers" do
      expect(multiply(2, 3)).to eq(6)
    end

    it "multiplies larger numbers" do
      expect(multiply(10, 15)).to eq(150)
    end
  end
end
