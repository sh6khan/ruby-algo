require 'minitest/autorun'

# Merge two already sorted arrays
# the arrays are not the same size

class Interview

  def merge_arrays(arr1, arr2)

    # ensure that arr1 is the longer of the two arrays
    if (arr1.length < arr2.length)
      arr1, arr2 = arr2, arr1
    end

    merged_array = []
    small_count = 0
    big_count = 0

    while(big_count < arr1.length)

      if (arr2[small_count] && arr2[small_count] < arr1[big_count])
        min_num = arr2[small_count]
        small_count+= 1
      else
        min_num = arr1[big_count]
        big_count +=1
      end

      merged_array.push(min_num)
    end

    return merged_array
  end
end

class Test < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    expected = [1,2,3,4,5,6]
    arr1 = [1,3,5,6]
    arr2 = [2,4]

    assert_equal(expected, @interview.merge_arrays(arr1, arr2))
  end

  def test_two
    expected = [1,2,3,4,5,6]
    arr2 = [1,3,5,6]
    arr1 = [2,4]

    assert_equal(expected, @interview.merge_arrays(arr1, arr2))
  end
end