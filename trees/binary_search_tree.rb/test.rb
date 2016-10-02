require 'minitest/autorun'
require_relative "node"
require_relative "binary_search_tree"

describe "BinarySearchTree" do
  it "should insert" do
    bst = BinarySearchTree.new

    bst.insert(Node.new(5))
    bst.insert(Node.new(4))
    bst.insert(Node.new(6))
    bst.insert(Node.new(3))
    bst.insert(Node.new(2))
    bst.insert(Node.new(7))
    bst.insert(Node.new(8))
    bst.insert(Node.new(9))

    bst.print_in_order
  end
end
