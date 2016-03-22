class Node

  attr_reader :name, :visited

  def initialize(name)
    @name = name
    @children = []
    @visited = false
  end

  def add_children(child_node)
    @children.push(child_node)
  end

  def all_children
    @children
  end

  def visited!
    @visited = true
  end 

  def all_unvisited_children
    @children.select{ |child| child.visited == false}
  end

  def to_s
    "#{@name} -> #{@children.map(&:name)}"
  end 
end 

class Graph

  def initialize
    @nodes = {}
  end

  # creates and edge between the parent node and the child node
  # if either of the nodes does not already exists then a new node is created
  # if either of the nodes does exits then add a child to the existing node
  #
  #
  def add_node_pair(parent_node_name, child_node_name)
    parent_node = @nodes[parent_node_name] || Node.new(parent_node_name)
    child_node = @nodes[child_node_name] || Node.new(child_node_name)

    parent_node.add_children(child_node)
    
    @nodes[parent_node_name] = parent_node
    @nodes[child_node_name] = child_node
  end

  def [](name)
    @nodes[name]
  end
end



