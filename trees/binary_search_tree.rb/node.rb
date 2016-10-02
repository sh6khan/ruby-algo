class Node
  include Comparable
  attr_reader :value
  attr_accessor :right, :left

  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end

  def <=>(other)
    @value <=> other.value
  end

  def insert(node)
    if node <= self
      @left.nil? ? @left = node : @left.insert(node)
    else
      @right.nil? ? @right = node : @right.insert(node)
    end
  end
end
