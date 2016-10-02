# given a sorted array find the element such that A[i] = i

require 'minitest/autorun'


def find_magic_index(array, start, finish)
  return false if start > finish

  mid = (start + finish) / 2
  return mid if array[mid] == mid

  if array[mid] < mid
    return find_magic_index(array, mid + 1, finish)
  else
    return find_magic_index(array, start, mid - 1)
  end
end

describe "It should the magic index" do
  it "should work" do
    arr = [-40, -20, -1, 1, 2, 3, 5, 7, 9, 12, 13]
    assert_equal(7, find_magic_index(arr, 0, arr.length - 1))
  end
end
