class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(node)
    if @root.nil?
      @root = node
    else
      @root.insert(node)
    end
  end

  def print_in_order(node=@root)
    return if node.nil?
    print_in_order(node.left)
    puts node.value
    print_in_order(node.right)
  end

end
