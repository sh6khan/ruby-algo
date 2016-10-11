# given a sorted array that has been rotated at a certain index
# find the index of the rotation point
# 4 5 6 7 0 1 2
# return 4

require 'minitest/autorun'

def find_rotation_index(nums, start, finish)
  return 0 if nums.first < nums.last

  return -1 if start > finish

  mid = (start + finish) / 2
  num = nums[mid]

  return mid if num < nums[mid + 1] && num < nums[mid - 1]

  if num > nums.first
    return find_rotation_index(nums, mid + 1, finish)
  else
    return find_rotation_index(nums, start, mid - 1)
  end
end

describe "Roation index finder" do
  it "should be able to find the rotation point" do
    arr = [4,5,6,7,0,1,2]
    a = find_rotation_index(arr, 0, arr.length - 1)
    assert_equal(a, 4);
  end

  it "should detect no roated arrays" do
    arr = (1..10).to_a
    a = find_rotation_index(arr, 0, arr.length - 1)
    assert_equal(a, 0)
  end
end
