# sum(Y) = round(sum(x))
# minmize (|y1-x1| + |y2-x2| + ... + |yn-xn|)
# Example1:
# input = 30.3, 2.4, 3.5
# output = 30 2 4
#
# Example2:
# input = 30.9, 2.4, 3.9
# output = 31 2 4

# airbnb

require 'minitest/autorun'

def round_em_up(floats)
  return [] if floats.nil? || floats.empty?
  
  float_totals = []
  int_totals = []

  float_totals[0] = floats.first
  int_totals[0] = floats.first.round

  rounded_ints = []
  rounded_ints[0] = int_totals[0]

  floats.each_with_index do |float, index|
    next if index == 0

    float_totals[index] = float_totals[index - 1] + float
    int_totals[index] = float_totals[index].round

    rounded_ints[index] = int_totals[index] - int_totals[index - 1]
  end

  # print float_totals
  # print int_totals
  return rounded_ints
end

describe "Rounding nums" do
  it "should round em up" do
    expected = [1,2,2,2,3,3]
    floats = [1.3, 1.7, 1.9, 2.1, 2.8, 3.1]

    assert_equal(expected, round_em_up(floats))
  end
end
