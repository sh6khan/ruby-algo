# Given a sequence of Land and water codes, find the longest island you can build by filling the water
# in between any two lands. You can fill only sequence of water, but any number of slots in that sequence.
#
# Example sequence:
# L, W, L, W, W, L, W
# The Longest sequence length is 4 because (Filled water slots are bolded)
# Let's fill water at slot 2 (index 1) so it becomes L,L,L,W,W,L,W. The longest L sequence is length 3
# Let's fill the two continuous water slots 4,5 (index 3,4) so it becomes L,W,L,L,L,L,W. The longest L sequence is length 4
# Let's fill the last water slot. So it becomes L,W,L,W,W,L,L . The longest L sequence now is 2.
#
# Best answer is O(N).
#
# airbnb

# use the greedy algorithm to find the longest continous sequence of
# water to be flipped into land

# INCOMPLETE
def longest_water_seq(islands)
  max = 0
  stack = []

  islands.each_with_index do |body, index|
    if body == "L"

    end
  end

  return [pre_land_count, max, land_count]
end

require 'minitest/autorun'

describe "Find the longest sequence of land and water" do
  it "should work" do
    islands = %w(L W L W W L W)
    assert_equal(4, longest_water_seq(islands))
  end
end
