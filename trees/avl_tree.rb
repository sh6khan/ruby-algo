
class Node
  attr_accessor :root, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class AvlTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if !root
      root = Node.new(value)
      return
    end

    current = root

    # find the the node which will act the parent
    while(current)
      if value > current.value
        current = current.right
      else
        current = current.left
      end
    end

    current = Node.new(value)
  end

  def determine_height
    
  end
end
