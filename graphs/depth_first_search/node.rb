require "set"

class Node
  attr_accessor :name, :adjacents

  def initialize(name)
    @name = name
    @adjacents = Set.new
  end

  def to_s
    @name
  end
end
