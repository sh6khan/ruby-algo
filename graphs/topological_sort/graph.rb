class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  # add node to adjacent nodes
  #
  # @param from [Node]
  # @param to [Node]
  def add_edge(from, to)
    from.adjacents << to
  end
end
