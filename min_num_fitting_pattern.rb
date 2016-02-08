require './test_helper'

# Interview Class
class Interview
  attr_accessor :nums

  def initialize
    @nums = %w(1 2 3 4 5 6 7 8 9)
  end

  def min_num(pattern)
    #first case
    pattern = pattern.split('')
    init = pattern[0]
    string_num = ""
    num_one, num_two = nums[0], nums[1]

    if init == 'I'
      string_num += num_one + num_two
    else
      string_num += num_two + num_one
    end

    nums.delete('1')
    nums.delete('2')

    pattern.each_with_index do |char, index|
      next if index == 0

      next_num = get_one

      if char == 'D'
        string_num = next_num + string_num
      else
        string_num = string_num + next_num
      end

    end

    return string_num


  end

  def get_one
    smallest_num = nums[0]
    nums.delete(smallest_num)

    return smallest_num
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 'DD'
    assert_equal('321', @interview.min_num(input))
  end

  def test_two
    input = 'DDIDDIID'
    assert_equal('321654798', @interview.min_num(input))
  end


end
