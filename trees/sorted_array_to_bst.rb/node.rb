class Node
  include Comparable
  attr_accessor :left, :right, :value
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def leaf?
    @left.nil? && @right.nil?
  end

  # define the comparison methods for the node class
  def <=>(other)
    @value <=> other.value
  end

  def insert(value)
    if @value <= value
      @right.nil? ? @right = Node.new(value) : @right.insert(value)
    else
      @left.nil? ? @left = Node.new(value) : @left.insert(value)
    end
  end

  def is_balanced?
    val = check_height(self)
    return val != -1
  end

  private

  def check_height(node)
    return 0 unless node

    right_subtree = check_height(node.right)
    return -1 if right_subtree == -1

    left_subtree = check_height(node.left)
    return -1 if left_subtree == -1


    return -1 if (right_subtree - left_subtree).abs > 1

    return (1 + [right_subtree, left_subtree].max)
  end
end
