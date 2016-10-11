class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def insert(val)
    if @val <= val
      @right.nil? ? @right = Node.new(val) : @right.insert(val)
    else
      @left.nil? ? @left = Node.new(val) : @left.insert(val)
    end
  end
end
