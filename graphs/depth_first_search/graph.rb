class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  # add an edge between two nodes
  def add_edge(nodeA, nodeB)
    nodeA.adjacents << nodeB
  end
end
