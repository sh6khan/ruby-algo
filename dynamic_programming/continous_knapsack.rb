# The continous Knapsack problem
# given a total weight and a sorted hash of wieght-value pairs
# what is the maximum total value that can be gotten from the items while still
# being under the total weight

require 'minitest/autorun'

class Knapsack
  attr_accessor :c
  def initialize(v, w)
    @memo = {}
    @memo[0] = 0
    @v = v
    @w = w
    @c = 0
  end

  def find_max(total_weight)
    @c += 1
    return @memo[total_weight] if @memo[total_weight]

    res = []
    @w.each_with_index do |w, index|
      next if w > total_weight
      res << (find_max(total_weight - w) + @v[index])
    end

    @memo[total_weight] = res.max
    return @memo[total_weight]
  end
end

describe "Continous Knapsack problems" do
  it "find the max val" do
    v = [1,3,4,5,7,9,0]
    w = [1,10,11,5,2,20,3]
    k = Knapsack.new(v, w)

    p k.find_max(20);
    p k.c
  end
end
