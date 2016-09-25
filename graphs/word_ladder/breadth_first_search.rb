require "set"

class BreadthFirstSearch
  def initialize(graph, source_node)
    @graph = graph
    @source_node = source_node
    @reverse_path = {}

    dfs
  end

  def has_path_to?(node)
    @reverse_path[node]
  end

  def shortest_path(node)
    path_count = 0
    current_node = node

    while current_node != @source_node
      path_count += 1
      current_node = @reverse_path[current_node]
    end

    return path_count + 1
  end

  private

  def dfs
    queue = []
    visited = Set.new

    queue << @source_node
    visited << @source_node

    while queue.any?
      node = queue.shift
      node.adjacents.each do |adj_node|
        next if visited.include?(adj_node)

        queue << adj_node
        visited << adj_node
        @reverse_path[adj_node] = node
      end
    end
  end
end
