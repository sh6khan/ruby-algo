class UnionFind
  def initialize(graph)
    @set = {}

    graph.nodes.each_with_index do |node, index|
      @set[node] = index
    end
  end

  def connected?(nodeA, nodeB)
    @set[nodeA] == @set[nodeB]
  end

  def union(nodeA, nodeB)
    return if connected?(nodeA, nodeB)

    nodeA_set = @set[nodeA]
    nodeB_set = @set[nodeB]

    @set.each do |node, set_id|
      @set[node] = nodeB_set if set_id == nodeA_set
    end
  end
end
