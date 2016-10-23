require 'set'

class Node
  attr_accessor :val, :adjacent
  
  def initialize(val)
    @val = val
    @adjacent = Set.new
  end

  def to_s
    @val
  end
end
