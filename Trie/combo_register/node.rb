class Node
  attr_accessor :val, :terminator, :child
  
  def initialize(val)
    @child = Array.new(26)
    @val = val
    @terminator = nil
  end

  def set_combo(name)
    @terminator = name
  end
end
