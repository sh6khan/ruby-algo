class WordLadder
  def initialize(starting_word, ending_word, word_list)
    word_list.unshift(starting_word)
    word_list << ending_word

    graph = build_graph(word_list)
    source_node = graph.nodes.first
    ending_node = graph.nodes.last

    shortest_length = BreadthFirstSearch.new(graph, source_node).shortest_path(ending_node)
  end

  private

  def build_graph(words)
    graph = Graph.new

    words.each do |word|
      words.each_with_index do |adj_word, index|
        next if index == 0

        nodeA = Node.new(word)
        nodeB = Node.new(adj_word)
        graph.add_edge(nodeA, nodeB)
      end
    end

    return graph
  end
end
