require 'minitest/autorun'
require_relative 'tree'
require_relative 'node'

describe "Balance Tree check" do
  it "not balanced" do
    tree = Tree.new
    tree.insert(5)
    tree.insert(6)
    tree.insert(7)
    tree.insert(1)
    tree.insert(9)

    assert_equal(false, tree.is_balanced?)
  end

  it "is balanced" do
    tree = Tree.new
    tree.insert(5)
    tree.insert(3)
    tree.insert(6)
    tree.insert(2)
    tree.insert(7)

    assert_equal(true, tree.is_balanced?)
  end
end
