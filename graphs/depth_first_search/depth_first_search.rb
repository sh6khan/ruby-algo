require "set"

class DepthFirstSearch
  # the depth first search will occur as a part of the initialization
  # of the object
  def initialize(graph, source_node)
    @searched_order = []
    @visited = Set.new
    @source_node = source_node
    @reverse_edge = {}
    depth_first_search(source_node)
  end

  def has_path_to?(node)
    @visited.include?(node)
  end

  def dfs_order
    @searched_order.map(&:to_s)
  end

  # find a path from node back to source node
  # can be done in O[n] time
  def path_to(node)
    path = []
    current_node = node

    while(current_node != @source_node)
      path << current_node
      current_node = @reverse_edge[current_node]
    end

    path << @source_node
    path.reverse.map(&:to_s)
  end

  private

  def depth_first_search(root_node)
    stack = [root_node]

    while !stack.empty?
      node = stack.pop

      @visited << node
      @searched_order << node

      node.adjacents.each do |adj_node|
        next if @visited.include?(adj_node)
        stack << adj_node
        @reverse_edge[adj_node] = node
      end
    end
  end

end
