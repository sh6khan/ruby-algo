require 'minitest/autorun'
require_relative "depth_first_search"
require_relative "graph"
require_relative "node"

describe "DepthFirstSearch" do
  before do
    @node1 = Node.new("1")
    @node2 = Node.new("2")
    @node3 = Node.new("3")
    @node4 = Node.new("4")
    @node5 = Node.new("5")
  end

  it "should be able to preform a depth first search in the right order" do
    graph = Graph.new
    graph.add_edge(@node1, @node2)
    graph.add_edge(@node1, @node5)
    graph.add_edge(@node2, @node3)
    graph.add_edge(@node2, @node4)
    graph.add_edge(@node4, @node5)

    expected = %w(1 5 2 4 3)

    order = DepthFirstSearch.new(graph, @node1).dfs_order
    assert_equal(order, expected)
  end

  it "should be able to find the quickest path from node1 to node5" do
    graph = Graph.new
    graph.add_edge(@node1, @node2)
    graph.add_edge(@node1, @node5)
    graph.add_edge(@node2, @node3)
    graph.add_edge(@node2, @node4)
    graph.add_edge(@node4, @node5)

    expected = %w(1 5)

    path = DepthFirstSearch.new(graph, @node1).path_to(@node5)
    assert_equal(expected, path)
  end
end
