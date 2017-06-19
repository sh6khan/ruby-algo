# Nodes of an undericted graph

class Node
  attr_accessor :value, :adjacents

  def initialize(value)
    @value = value
    @connections = 0
    @adjacents = Set.new
  end

  def to_s
    return @value
  end
end
