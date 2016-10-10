class Node
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  def bst_insert(val)
    if @val <= val
      @right.nil? ? @right = Node.new(val) : @right.insert(val)
    else
      @left.nil? ? @left = Node.new(val) : @left.insert(val)
    end
  end
end
