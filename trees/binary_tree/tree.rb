require_relative "node"

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

  def level_order
    node = @root
    queue = []
    queue << node

    while queue.any?
      node = queue.pop
      if node == "#"
        print "# "
        next
      end

      print "#{node.val} "
      left_child = node.right || "#"
      right_child = node.left || "#"

      queue << left_child
      queue << right_child
    end

  end

  def print_in_oder(node=@root)
    return if node.nil?

    puts node.val
    print_in_oder(node.left)
    print_in_oder(node.right)
  end
end
