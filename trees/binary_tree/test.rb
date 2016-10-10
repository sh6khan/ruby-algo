require 'minitest/autorun'
require_relative "tree"

describe "binary search tree" do
  it "should insert" do
    tree = BinarySearchTree.new
    tree.bst_insert(10)
    tree.bst_insert(9)
    tree.bst_insert(11)
    tree.bst_insert(8)
    tree.bst_insert(12)

    tree.print_in_oder
  end
end
