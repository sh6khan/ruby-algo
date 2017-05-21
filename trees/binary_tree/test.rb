require 'minitest/autorun'
require_relative "tree"

describe "binary search tree" do
  it "should insert" do
    tree = BinarySearchTree.new
    tree.insert(10)
    tree.insert(9)
    tree.insert(11)
    tree.insert(8)
    tree.insert(12)

    tree.print_in_oder
  end

  it "should print in level order" do
    tree = BinarySearchTree.new
    tree.insert(10)
    tree.insert(9)
    tree.insert(11)
    tree.insert(8)
    tree.insert(12)

    tree.level_order
  end

end
