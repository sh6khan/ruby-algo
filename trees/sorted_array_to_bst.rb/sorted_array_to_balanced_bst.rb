# given a sorted array, place all the elements in to a balanced binary
# tree

require_relative 'tree'
require 'minitest/autorun'

class BstPlacer
  def initialize
    @tree = Tree.new
  end

  def place_array(sorted_array)
    place_in_balanced_bst(sorted_array, 0, sorted_array.length - 1)
  end


  def print_tree
    @tree.print_in_order
  end

  def is_balanced?
    @tree.is_balanced?
  end


  private

  def place_in_balanced_bst(sorted_array, start, finish)
    return if start > finish

    mid = (start + finish) / 2
    value = sorted_array[mid]

    @tree.insert(value)

    place_in_balanced_bst(sorted_array, mid + 1, finish)
    place_in_balanced_bst(sorted_array, start, mid - 1)
  end
end

describe "BstPlacer" do
  it "should place elements in a balanced BST" do
    arr = [1,2,3,4,5,6,7,8,9,10]
    bst_placer = BstPlacer.new
    bst_placer.place_array(arr)

    #bst_placer.print_tree
  end

  it "should be able to validated a tree that is balanced" do
    tree = Tree.new
    tree.insert(5)
    tree.insert(3)
    tree.insert(7)

    assert_equal(true, tree.is_balanced?)

    tree.insert(10)
    tree.insert(11)
    tree.insert(12)
    tree.insert(13)

    assert_equal(false, tree.is_balanced?)
  end
end
