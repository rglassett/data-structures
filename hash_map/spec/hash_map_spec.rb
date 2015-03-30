require 'rspec'
require 'hash_map'

describe MyHashMap do
  subject(:hash) do
    MyHashMap.new
  end

  describe "#add" do
    it "adds key-value pairs to the hash" do
      hash.add("hello", "world")

      expect(hash.get("hello")).to eq("world")
    end

    it "raises an error when adding a key that already exists" do
      hash.add("hello", "world")

      expect { hash.add("hello", "world") }.to raise_error
    end
  end

  describe "#get" do
    it "gets the value of an existing key" do
      hash.add('hello', 'world')

      expect(hash.get('hello')).to eq('world')
    end

    it "returns nil when getting a key that does not exist" do
      expect(hash.get("hello")).to be_nil
    end
  end

  describe "#put" do
    it "adds key-value pairs to the hash" do
      hash.put("hello", "world")

      expect(hash.get("hello")).to eq("world")
    end

    it "replaces a key-value pair if it already exists" do
      hash.add("hello", "world")
      hash.put("hello", "dave")

      expect(hash.get("hello")).to eq("dave")
    end
  end

  describe "#delete" do
    it "deletes key-value pairs from the hash" do
      hash.add("hello", "world")
      hash.add("goodbye", "world")
      hash.delete("hello")

      expect(hash.get("hello")).to be_nil
      expect(hash.get("goodbye")).to eq("world")
    end
  end

  describe "#keys" do
    it "returns a list of keys in the hash" do
      expect(hash.keys).to eq([])

      hash.add("foo", "bar")
      hash.add("hello", "world")

      expect(hash.keys).to contain_exactly("foo", "hello")
    end
  end

  describe "#values" do
    it "returns a list of values in the hash" do
      expect(hash.values).to eq([])

      hash.add("foo", "bar")
      hash.add("hello", "world")

      expect(hash.values).to contain_exactly("foo", "hello")
    end
  end
end
