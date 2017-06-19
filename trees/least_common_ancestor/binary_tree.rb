require_relative 'node'

class Tree
  attr_accessor :root

  def initialize()
    @root = nil
  end

  def find_LCA(root = @root, a, b)
    return nil if !root

    return root if root.val == a || root.val == b

    find_left = find_LCA(root.left, a, b)
    find_right = find_LCA(root.right, a, b)

    return root if (find_left && find_right)

    return find_right == nil ? find_left : find_right
  end
end
