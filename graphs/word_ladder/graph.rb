class Graph
  attr_reader :nodes

  def initialize
    @nodes = []
  end

  # based on the question, the order here actually matters
  # the first node in the nodes array is also going to be
  # our source node
  def add_edge(nodeA, nodeB)
    nodeA.adjacents << nodeB
    nodeB.adjacents << nodeA

    @nodes << nodeA
    @nodes << nodeB
  end
end
