# undericted graph composed of Node objects

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_edge(nodeA, nodeB)
    nodeA.adjacents << nodeB
    nodeB.adjacents << nodeA

    nodeA.connections += 1
    nodeB.connections ++ 1
  end

  def delete_edge_nodes
    nodes.each do |node|
      if node.connections == 1
        node.adjacents.each do |adj_node|
          adj_node.adjacents.remove(node)
        end

        node.delete(node)
      end
    end
  end
end
