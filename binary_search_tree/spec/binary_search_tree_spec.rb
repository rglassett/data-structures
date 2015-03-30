require 'rspec'
require 'binary_search_tree'

describe BinarySearchTree do
  describe "#initialize" do
    context "when given options" do
      let!(:prc) { Proc.new { |x, y| y <=> x } }
      let(:node) { BSTNode.new(10, &prc) }

      it "sets the key" do
        expect(node.key).to eq(10)
      end

      it "sets the comparator" do
        expect(node.comparator).to be(prc)
      end
    end

    context "when not given options" do
      let(:node) { BSTNode.new }

      it "sets a default key" do
        expect(node.key).to be_nil
      end

      it "sets a default comparator" do
        expect(node.comparator).to be_a(Proc)
      end
    end
  end

  describe "#insert" do
    context "when the node is a leaf" do
      let(:node) { BSTNode.new }

      before(:example) do
        node.insert(10)
      end

      it "sets the key" do
        expect(node.key).to eq(10)
      end

      it "adds left and right branches" do
        expect(node.left).not_to be_nil
        expect(node.right).not_to be_nil
      end
    end

    context "when the node is not a leaf" do
      let!(:comparator) { Proc.new { |x, y| y <=> x } }
      let(:node) { BSTNode.new(10, &comparator) }

      context "and comparator returns -1" do
        it "inserts to the left" do
          node.insert(20)

          expect(node.left.key).to eq(20)
        end
      end

      context "and comparator returns 0" do
        it "does not change the branches" do
          node.insert(10)

          expect(node.key).to eq(10)
          expect(node.left).to be_leaf
          expect(node.right).to be_leaf
        end
      end

      context "and comparator returns 1" do
        it "inserts to the right" do
          node.insert(1)

          expect(node.right.key).to eq(1)
        end
      end
    end
  end
end
