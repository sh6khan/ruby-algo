class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert(value)
    if @value <= value
      @right.nil? ? @right = Node.new(value) : @right.insert(value)
    else
      @left.nil? ? @left = Node.new(value) : @left.insert(value)
    end
  end

  def valid_bst?
    min = 0
    max = 100_000

    return validate_bst_subtree(self, min, max)
  end

  private

  def validate_bst_subtree(node, min, max)
    return true unless node

    return false if node.value < min || node.value > max


    res1 = validate_bst_subtree(node.left, min, node.value)
    res2 = validate_bst_subtree(node.right, node.value, max)

    return res1 && res2
  end
end
