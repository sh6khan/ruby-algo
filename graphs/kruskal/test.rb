require 'minitest/autorun'
require_relative "node"
require_relative "graph"
require_relative "union_find"
require_relative "cycle_detector"

describe "detect a cycle" do
  it "should be able to detect a cycle" do
    graph = Graph.new

    graph.add_node(node0 = Node.new("Node #0"))
    graph.add_node(node1 = Node.new("Node #1"))
    graph.add_node(node2 = Node.new("Node #2"))
    graph.add_node(node3 = Node.new("Node #3"))
    graph.add_node(node4 = Node.new("Node #4"))
    graph.add_node(node5 = Node.new("Node #5"))
    graph.add_node(node6 = Node.new("Node #6"))
    graph.add_node(node7 = Node.new("Node #7"))

    graph.add_edge(node0, node7)
    graph.add_edge(node2, node3)
    graph.add_edge(node1, node7)
    graph.add_edge(node0, node2)
    graph.add_edge(node5, node7)
    graph.add_edge(node1, node3)
    graph.add_edge(node1, node5)
    graph.add_edge(node2, node7)
    graph.add_edge(node4, node5)
    graph.add_edge(node1, node2)
    graph.add_edge(node4, node7)
    graph.add_edge(node0, node4)
    graph.add_edge(node6, node2)

    cycle_detector = CycleDetector.new(graph)

    assert_equal(true, cycle_detector.contains_cycle?)
  end
end
