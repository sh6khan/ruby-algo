require_relative 'node'

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(val)
    if @root.nil?
      @root = Node.new(val)
    else
      @root.insert(val)
    end
  end

  # change a value in the node to make the BST invalid
  # used for testing
  def invalidate
    node = @root
    while node.left
      node = node.left
    end

    node.value = 100
  end



  def valid?
    return @root.valid_bst?
  end
end
