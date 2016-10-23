require_relative 'node'
require 'set'

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = Set.new
    @chars = {}
  end

  def add_edge(char_a, char_b)
    node_a = @chars[char_a] || Node.new(char_a)
    node_b = @chars[char_b] || Node.new(char_b)

    @nodes << node_a
    @nodes << node_b

    @chars[char_a] = node_a
    @chars[char_b] = node_b
  end
end
