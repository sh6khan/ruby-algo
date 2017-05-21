class Node
  attr_accessor :left, :right, :next, :prev, :val

  def initialize(value)
    @val = value
    @left = nil
    @right = nil
    @next = nil
    @prev = nil
  end


  def insert(val)
    if @val <= val
      # insert to the right
      @right.nil? ? @right = Node.new(val) : @right.insert(val)
    else
      #insert to the left
      @left.nil? ? @left = Node.new(val) : @left.insert(val)
    end
  end
end
