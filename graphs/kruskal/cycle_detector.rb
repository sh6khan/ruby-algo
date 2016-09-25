require_relative "union_find"

class CycleDetector
  def initialize(graph)
    union_find = UnionFind.new(graph)

    @cycle = false

    graph.edges.each do |edge|
      start_node = edge.start_node
      end_node = edge.end_node

      if union_find.connected?(start_node, end_node)
        @cycle = true
        break
      end

      union_find.union(start_node, end_node)
    end
  end

  def contains_cycle?
    @cycle
  end
end
