require_relative "node"

class Trie
  def initialize
    @root = Node.new
    @char_map = ("a".."z").to_a
  end

  def insert(str)
    root = @root

    str.each_char do |char|
      index = @char_map.find_index(char)

      if root.children[index]
        root = root.children[index]
        next
      end

      new_node = Node.new
      new_node.char = char
      root.children[index] = new_node
      root = new_node
    end

    root.word = str
  end

  def search(str)
    root = @root

    str.each_char do |char|
      index = @char_map.find_index(char)

      return if !root.children[index]

      root = root.children[index]
    end
  end
end
