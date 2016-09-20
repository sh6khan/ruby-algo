require "set"

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = Set.new
  end

  def add_edge(nodeA, nodeB, edge_weight)
    return false if edge_weight <= 0

    nodeA.adjacents << {
      node: nodeB,
      edge_weight: edge_weight
    }

    @nodes << nodeA
    @nodes << nodeB
  end
end
