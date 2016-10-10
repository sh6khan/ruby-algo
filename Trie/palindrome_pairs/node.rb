class Node
  attr_accessor :next, :char, :word

  def initialize
    @children = []
    @char = nil
    @word = nil
  end
end
