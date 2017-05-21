# Given an integer x and an array y, create a function that returns
# true if x exists as a sum of any contiguous elements in y.

require 'minitest/autorun'

def sum_exists(target, array)

  total = 0
  start = 0
  array.each_with_index do |num, index|
    next if num > target

    total += num
    if total > target
      total -= array[start]
      start += 1
    end

    if (total == target)
      return true
    end

  end

  return false
end


describe "test" do
  it "should return true" do
    nums = [1,2,3,4,5,6,7,8,9]
    assert_equal(true, sum_exists(9, nums))
  end


  it "should return false" do
    nums = [1,2,3,4,5,6,7,8,9]
    assert_equal(false, sum_exists(1000, nums))
  end
end
