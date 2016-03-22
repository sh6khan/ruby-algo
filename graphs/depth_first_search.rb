require "./graph"

# first create the graph
graph = Graph.new

graph.add_node_pair("A", "C")
graph.add_node_pair("A", "B")
graph.add_node_pair("A", "D")
graph.add_node_pair("C", "F")
graph.add_node_pair("D", "F")
graph.add_node_pair("B", "E")


# This is actually a depth first traversal more than a search


dfs = []
start = graph["A"]

dfs << start
result = []

# declare the starting node as visited
start.visited!

# add the starting element to 
result << start.name


while dfs.any?
  current_node = dfs.last

  current_unvisited_children = current_node.all_unvisited_children

  if current_unvisited_children.any?
    next_child = current_unvisited_children.first 

    next_child.visited!
    result << next_child.name
    dfs << next_child
  else
    dfs.pop
  end
end

print result
puts ""

