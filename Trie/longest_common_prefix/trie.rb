require_relative 'node'

class Trie
  def initialize
    @root = Node.new
    @char_map = ("a".."z").to_a
  end

  def longest_common_prefix
    prefix = []

    node = @root
    letter = @root.next_chars

    return prefix.join if letter.length > 1

    while (letter.length == 1)
      prefix << node.char
      node = letter.first
      letter = node.next_chars
    end

    prefix << node.char
    return prefix.join
  end

  def insert(word)
    node = @root

    word.each_char do |char|
      index = @char_map.find_index(char)

      # enter the next node if it exists
      if node.children[index]
        node = node.children[index]
        next
      end

      # create a new node at that index
      new_node = Node.new
      new_node.set_char(char)

      node.children[index] = new_node
      node = new_node
    end

    # after reaching the last char
    # set it as the terminator
    node.terminator = true
  end

  private

  def search_node(string)
    node = @root

    # travers the Trie
    string.each_char do |char|
      index = @char_map.find_index(char)
      return if !node.children[index]
      node = node.children[index]
    end

    # same check as string.empty?
    return if node == @root

    # success !
    return node
  end
end
