class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  def leaf?
    @right && @left
  end

  def to_s
    @val
  end

  def is_balanced?
    res = check_height(self)
    return res != -1
  end

  def insert(val)
    if @val <= val
      @right.nil? ? @right = Node.new(val) : @right.insert(val)
    else
      @left.nil? ? @left = Node.new(val) : @left.insert(val)
    end
  end

  private

  def check_height(node)
    return 0 if node == nil

    right_subtree = check_height(node.right)
    return -1 if right_subtree == -1

    left_subtree = check_height(node.left)
    return -1 if left_subtree == -1

    if (left_subtree - right_subtree).abs > 1
      return -1
    end

    return 1 + [left_subtree, right_subtree].max
  end
end
