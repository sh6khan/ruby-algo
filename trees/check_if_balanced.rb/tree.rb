require_relative 'node'

class Tree
  def initialize
    @root = nil
  end

  def is_balanced?
    return @root.is_balanced?
  end

  def insert(val)
    if @root.nil?
      @root = Node.new(val)
    else
      @root.insert(val)
    end
  end
end
