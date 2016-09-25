require 'minitest/autorun'

require_relative "node"
require_relative "ladder"

describe "Node" do
  it "should be able to determine single letter difference" do
    nodeA = Node.new("set")
    nodeB = Node.new("seb")

    assert_equal(true, nodeA.can_jump_to?(nodeB))

    nodeA = Node.new("set")
    nodeB = Node.new("stc")

    assert_equal(false, nodeA.can_jump_to?(nodeB))
  end

  it "should be able to find the shortest path len" do
    #TODO - add tests for this Im pretty sure it works idk
    word_list = ["hot","dot","dog","lot","log"]
    starting_word = "hit"
    ending_word = "cog"

    word
  end
end
