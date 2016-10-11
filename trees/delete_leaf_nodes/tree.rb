require_relative "node"

class Tree
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


  def find_leave_nodes(root=@root, res)
    return unless root

    height = max_height(root)
    res[height] ||= []
    res[height] << root.val

    find_leave_nodes(root.right, res)
    find_leave_nodes(root.left, res)
  end

  private

  def max_height(node)
    return -1 unless node

    res_right = max_height(node.right)
    res_left = max_height(node.left)

    return [res_right, res_left].max  + 1
  end
end
