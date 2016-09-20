require "set"

class BreadthFirstSearch
  def initialize(graph, source_node)
    @visited = Set.new
    @source_node = source_node
    @searched_order = []
    @reverse_edge = {}

    breath_first_search(source_node)
  end

  def bfs_order
    @searched_order.map(&:to_s)
  end

  def shortest_path_to(node)
    path = []
    current_node = node

    while (current_node != @source_node)
      path << current_node
      current_node = @reverse_edge[current_node]
    end

    path << @source_node
    path.reverse
  end

  private

  def has_path_to?(node)
    @visited.include?(node)
  end

  def breath_first_search(node)
    queue = [node]
    @visited << node

    while queue.any?
      node = queue.shift
      node.adjacents.each do |adj_node|
        next if @visited.include?(adj_node)
        queue << adj_node
        
        @searched_order << adj_node
        @reverse_edge[adj_node] = node
        @visited << adj_node
      end
    end
  end
end
