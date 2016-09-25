require_relative "edge"

class Graph
  attr_accessor :nodes, :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    @nodes << node
  end

  def add_edge(nodeA, nodeB)
    @edges << Edge.new(nodeA, nodeB)
  end
end
