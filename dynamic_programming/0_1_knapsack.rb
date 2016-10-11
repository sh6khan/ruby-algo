# Same as the Continous knapsack problem only now we can only take at most 1 of
# each item

# wt = 1 3 4 5
# val = 1 4 5 7
# wt = 7
require 'set'

class Knapsack
  def initialize(wt, vals)
    @memo = {}
    @memo[0] = 0
    @wt = wt
    @vals = vals
  end

  def max_value(total, taken)
    return @memo[total] if @memo[total]

    res = [0]
    @wt.each_with_index do |wt, index|
      next if wt > total || taken.include?(index)
      taken << index

      current_val = max_value(total - wt, taken) + @vals[index]
      res << current_val

      taken.delete(index)
    end

    p res
    @memo[total] = res.max
    return @memo[total]
  end

end

wt = [1,3,4,5]
vals = [1,4,5,7]

k = Knapsack.new(wt, vals)
set = Set.new
p k.max_value(7, set)
p k.c
