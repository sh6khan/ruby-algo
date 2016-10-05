require_relative 'node'

class Tree
  def initialize
    @root = nil
  end

  def is_balanced?
    @root.is_balanced?
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    else
      @root.insert(value)
    end
  end


  def print_in_order(node=@root)
    return if node.nil?

    puts node.value
    print_in_order(node.right)
    print_in_order(node.left)
  end
end
