require 'minitest/autorun'
require_relative "priority_queue"
require_relative "dijkstras"
require_relative "node"
require_relative "graph"

describe "PriorityQueue" do
  it "should allow enqueuing and dequeueing in sorted order" do
    queue = PriorityQueue.new
    queue.enqueue("1", 1)
    queue.enqueue("2", 2)
    queue.enqueue("4", 4)
    queue.enqueue("3", 3)

    expected = {}
    expected["1"] = 1
    expected["2"] = 2
    expected["4"] = 4
    expected["3"] = 3

    assert_equal(expected, queue.return_queue)

    min = queue.dequeue

    expected = {}
    expected["2"] = 2
    expected["4"] = 4
    expected["3"] = 3

    assert_equal(expected, queue.return_queue)
  end
end

describe "Compute shortest path" do
  graph = Graph.new

  node0 = Node.new("Node #0")
  node1 = Node.new("Node #1")
  node2 = Node.new("Node #2")
  node3 = Node.new("Node #3")
  node4 = Node.new("Node #4")
  node5 = Node.new("Node #5")
  node6 = Node.new("Node #6")
  node7 = Node.new("Node #7")

  graph.add_edge(node0, node1, 5)
  graph.add_edge(node0, node4, 9)
  graph.add_edge(node0, node7, 8)
  graph.add_edge(node1, node2, 12)
  graph.add_edge(node1, node3, 15)
  graph.add_edge(node1, node7, 4)
  graph.add_edge(node2, node3, 3)
  graph.add_edge(node2, node6, 11)
  graph.add_edge(node3, node6, 9)
  graph.add_edge(node4, node5, 4)
  graph.add_edge(node4, node6, 20)
  graph.add_edge(node4, node7, 5)
  graph.add_edge(node5, node2, 1)
  graph.add_edge(node5, node6, 13)
  graph.add_edge(node7, node5, 6)
  graph.add_edge(node7, node2, 7)

  shortest_path = Dijkstras.new(graph, node0).shortest_path_to(node3)

  expected = ["Node #0", "Node #4", "Node #5", "Node #2", "Node #3"]
  p shortest_path
end
