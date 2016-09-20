class Graph
  def add_edge(nodeA, nodeB)
    nodeA.adjacents << nodeB
  end
end
