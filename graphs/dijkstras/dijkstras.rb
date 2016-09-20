require_relative "priority_queue"

class Dijkstras
  def initialize(graph, source_node)
    @source_node = source_node
    @queue = PriorityQueue.new
    @graph = graph
    @reverse_path = {}
    @distance_to = {}

    reset_all_distances_to(Float::INFINITY)
    compute_shortest_path
  end

  def shortest_path_to(node)
    return unless @reverse_path[node]

    path = []
    current_node = node

    while current_node != @source_node
      path << current_node
      current_node = @reverse_path[current_node]
    end

    path << @source_node
    return path.reverse.map(&:to_s)
  end

  private

  def reset_all_distances_to(new_distance)
    @graph.nodes.each do |node|
      @distance_to[node] = new_distance
    end
  end

  def compute_shortest_path
    reset_all_distances_to(Float::INFINITY)

    @distance_to[@source_node] = 0
    @queue.enqueue(@source_node, 0)

    while @queue.any?
      node = @queue.dequeue
      node.adjacents.each do |adj_node_info|
        relax(node, adj_node_info)
      end
    end

  end

  # @param current_node {Node}
  # @param adj_node_info
  # @param adj_node_info node {Node} - the adj node
  # @param adj_node_info edge_weight {Int} - the distance from current node to adj node
  def relax(current_node, adj_node_info)
    adj_node = adj_node_info[:node]
    new_distance = @distance_to[current_node] + adj_node_info[:edge_weight]

    return if @distance_to[adj_node] < new_distance

    @distance_to[adj_node] = new_distance
    @reverse_path[adj_node] = current_node

    @queue.enqueue(adj_node, new_distance)
  end
end
