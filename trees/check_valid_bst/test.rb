require_relative 'tree'
require 'minitest/autorun'

describe "Tree" do
  it "should be valid" do
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(3)
    tree.insert(4)
    tree.insert(8)
    tree.insert(10)

    assert_equal(true, tree.valid?)
  end

  it "should not be valid" do
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(3)
    tree.insert(4)
    tree.insert(8)
    tree.insert(10)

    tree.invalidate

    assert_equal(false, tree.valid?)
  end
end
