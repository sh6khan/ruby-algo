class Node
  attr_reader :char
  attr_accessor :terminator, :children

  def initialize
    @char = nil
    @children = Array.new(26)
    @terminator = false
  end

  def set_char(char)
    @char = char
  end

  def next_chars
    @children.compact
  end
end
