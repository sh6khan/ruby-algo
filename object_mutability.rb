class Ob
  attr_accessor :nodes
  def initialize(arr)
    @nodes = arr
  end
end

arr = [1,2,3,4,5]
o = Ob.new(arr)
puts "before change #{o.nodes}"
arr[0] = 10
puts "after change #{o.nodes}"
