# this is the node class of a Trie
# we are going to use an array to represent the 26 children
# of each node
# note this only handles the a-z english characters

class Node
  attr_accessor :terminator, :children, :val

  def initialize
    @children = Array.new(26)
    @val = nil
    @terminator = false
  end
end
