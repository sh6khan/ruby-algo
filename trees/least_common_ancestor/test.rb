require 'minitest/autorun'
require_relative "binary_tree"

describe "should convert into linkedlist" do
  it "should insert and change to linked list" do
    tree = Tree.new()
    tree.root = Node.new(1)
    tree.root.left = Node.new(2)
    tree.root.right = Node.new(3)
    tree.root.left.left = Node.new(4)
    tree.root.left.right = Node.new(5)
    tree.root.right.left = Node.new(6)
    tree.root.right.right = Node.new(7)

    puts tree.find_LCA(4, 5).val
    puts tree.find_LCA(4, 6).val
    puts tree.find_LCA(3, 4).val
    puts tree.find_LCA(2, 4).val
  end
end
