require_relative "node"

class BinarySearchTree
  def initialize
    @root = nil
  end

  def bst_insert(val)
    if @root.nil?
      @root = Node.new(val)
    else
      @root.insert(val)
    end
  end

  def print_in_oder(node=@root)
    return if node.nil?

    puts node.val
    print_in_oder(node.left)
    print_in_oder(node.right)
  end
end
