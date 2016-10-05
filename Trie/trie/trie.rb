# this is the larger trie structure composed of Nodes
require_relative 'node'

class Trie
  def initialize
    @root = Node.new
    @char_map = ("a".."z").to_a
    @all_words_that_start_with = []
  end

  def contains_word?(word)
    final_node = search_node(word)
    return false unless final_node
    return final_node.terminator
  end

  def search_node(string)
    root = @root

    string.each_char do |char|
      index = @char_map.find_index(char)

      if root.children[index]
        root = root.children[index]
      else
        return
      end
    end

    return if root == @root
    return root
  end

  def all_words_that_start_with(string)
    @all_words_that_start_with = []

    root = @root
    current_word = []

    string.each_char do |char|
      index = @char_map.find_index(char)
      return if !root.children[index]

      root = root.children[index]
      current_word << char
    end

    full_traversal_from_node(root, current_word)
    return @all_words_that_start_with
  end

  def full_traversal_from_node(node, current_word)
    if node.terminator
      @all_words_that_start_with << current_word.join
    end

    letter_nodes = node.children.compact

    letter_nodes.each do |char_node|
      current_word << char_node.val

      full_traversal_from_node(char_node, current_word)

      current_word.pop
    end
  end

  def insert(word)
    root = @root

    word.each_char do |char|

      index = @char_map.find_index(char)

      if !root.children[index]
        temp = Node.new
        temp.val = char
        root.children[index] = temp
        root = temp
      else
        root = root.children[index]
      end

    end

    root.terminator = true
  end
end
