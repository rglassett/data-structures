require 'rspec'
require 'binary_search_tree'
require 'byebug'

describe BSTNode do
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

  describe "#search" do
    let(:search_tree) { BSTNode.new(10) }

    before(:example) do
      search_tree.insert(5)
      search_tree.insert(7)
      search_tree.insert(15)
      search_tree.insert(12)
      search_tree.insert(20)
    end

    it "returns nil if the key is not found" do
      expect(search_tree.search(1)).to be_nil
    end

    it "returns the node if the key is found" do
      result = search_tree.search(7)

      expect(result).to be_a(BSTNode)
      expect(result.key).to eq(7)
    end
  end

  describe "#delete" do
    let!(:search_tree) { BSTNode.new(10) }
    let(:node_five) { search_tree.search(5) }
    let(:node_seven) { search_tree.search(7) }
    let(:node_fifteen) { search_tree.search(15) }
    let(:node_twelve) { search_tree.search(12) }
    let(:node_twenty) { search_tree.search(20) }

    before(:example) do
      search_tree.insert(5)
      search_tree.insert(7)
      search_tree.insert(15)
      search_tree.insert(12)
      search_tree.insert(20)
    end

    #   10
    #   |
    #  -----
    #  |   |
    #  5   15
    #  |   |
    # ---  -----
    # | |  |   |
    #   7  12  20

    context "when deleting a node with no children" do
      it "removes the node" do
        expect(search_tree.search(7).key).to eq(7)

        search_tree.delete(7)

        expect(search_tree.search(7)).to be_nil
      end
    end

    context "when deleting a node with one child" do
      it "replaces itself in the parent" do
        expect(search_tree.left).to be(node_five)

        search_tree.delete(5)

        expect(search_tree.left).to be(node_seven)
      end

      it "sets the parent of the replacement" do
        expect(node_seven.parent).to be(node_five)

        search_tree.delete(5)

        expect(node_seven.parent).to be(search_tree)
      end
    end

    context "when deleting a node with two children" do
      it "deletes the key from the tree" do
        expect(search_tree.search(15)).not_to be_nil

        search_tree.delete(15)

        expect(search_tree.search(15)).to be_nil
      end

      it "sets its key to that of its next successor" do
        node_fifteen = search_tree.search(15)
        expect(node_fifteen.key).to eq(15)

        search_tree.delete(15)

        expect(node_fifteen.key).to eq(20)
      end

      it "removes the next successor from the tree" do
        node_fifteen
        search_tree.delete(15)

        expect(node_fifteen.right).to be_leaf
      end
    end
  end
end
