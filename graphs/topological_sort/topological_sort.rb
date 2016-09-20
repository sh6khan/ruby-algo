require 'minitest/autorun'
require_relative 'graph'
require_relative 'node'

class TopologicalSort
  def initialize()
    @sorted_order = []
    @visited = {}
  end

  def sort(graph)
    graph.nodes.each do |node|
      depth_first_search(node) unless @visited[node]
    end

    return @sorted_order.reverse
  end

  private

  def depth_first_search(root)
    @visited[root] = true

    root.adjacents.each do |node|
      depth_first_search(node) unless @visited[node]
    end

    @sorted_order << root
  end
end

class Tests < MiniTest::Test
  def setup
    @topological = TopologicalSort.new
  end

  def test_one
    graph = Graph.new

    graph.nodes << (nodeA = Node.new("A"))
    graph.nodes << (nodeB = Node.new("B"))
    graph.nodes << (nodeC = Node.new("C"))
    #graph.nodes << (nodeD = Node.new("D"))
    graph.nodes << (nodeE = Node.new("E"))
    graph.nodes << (nodeF = Node.new("F"))
    #graph.nodes << (nodeG = Node.new("G"))
    #graph.nodes << (nodeH = Node.new("H"))


    graph.add_edge(nodeF, nodeC)
    graph.add_edge(nodeF, nodeA)
    graph.add_edge(nodeF, nodeB)

    graph.add_edge(nodeC, nodeA)

    graph.add_edge(nodeB, nodeA)
    graph.add_edge(nodeB, nodeE)

    #graph.add_edge(nodeD, nodeG)

    graph.add_edge(nodeA, nodeE)

    sorted = @topological.sort(graph).map(&:to_s)
    expected = ["F","C","B","A","E"]
    assert_equal(expected, sorted)

  end

  def test_two
    graph = Graph.new

    graph.nodes << (nodeA = Node.new("A"))
    graph.nodes << (nodeB = Node.new("B"))
    graph.nodes << (nodeC = Node.new("C"))
    graph.nodes << (nodeD = Node.new("D"))
    graph.nodes << (nodeE = Node.new("E"))
    graph.nodes << (nodeF = Node.new("F"))
    graph.nodes << (nodeG = Node.new("G"))
    graph.nodes << (nodeH = Node.new("H"))


    graph.add_edge(nodeF, nodeC)
    graph.add_edge(nodeF, nodeA)
    graph.add_edge(nodeF, nodeB)

    graph.add_edge(nodeC, nodeA)

    graph.add_edge(nodeB, nodeA)
    graph.add_edge(nodeB, nodeE)
    graph.add_edge(nodeB, nodeH)

    graph.add_edge(nodeD, nodeG)

    graph.add_edge(nodeA, nodeE)

    sorted = @topological.sort(graph).map(&:to_s)

    expected = ["F", "D", "G", "C", "B", "H", "A", "E"]
    assert_equal(expected, sorted)
  end

end
