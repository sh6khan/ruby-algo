require_relative 'node'
require_relative 'graph'
require 'set'

class AlienDictionaryDecoder
  def initialize(words)
    @words = words
    @graph = Graph.new
    @alphabet = []

    @visited = Set.new


    build_graph
  end

  def alphabet
    return @alphabet.join('')
  end

  def topo_sort
    @graph.nodes.each do |node|
      depth_first_search(node) unless @visited.include?(node)
    end
  end


  private

  def build_graph
    @words.each do |word|
      count = 1
      while count < word.length
        # word[count - 1] ---> word[count]
        @graph.add_edge(word[count - 1], word[count])
        count += 1
      end
    end
  end

  def depth_first_search(node)
    return unless node

    node.adjacent.each do |adj_node|
      depth_first_search(adj_node) unless @visited.include?(adj_node)
    end

    @alphabet << node.val
    @visited << node
  end
end
