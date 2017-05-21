require 'minitest/autorun'
require_relative "tree"

describe "should convert into linkedlist" do
  it "should insert and change to linked list" do
    tree = Tree.new
    tree.insert(5)
    tree.insert(3)
    tree.insert(6)
    tree.insert(1)
    tree.insert(4)
    tree.insert(8)
    tree.insert(0)
    tree.insert(2)
    tree.insert(7)
    tree.insert(9)

    tree.print_in_order

    tree.to_linked_list

    tree.print_linked_list
  end

end
