class Edge
  attr_accessor :start_node, :end_node

  def initialize(start_node, end_node)
    @start_node = start_node
    @end_node = end_node
  end
end
