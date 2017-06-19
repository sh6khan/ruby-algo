# Given an array of `red` `blue` and `white`
# sort the array such that all the reds, blues and whites
# are together

require './test_helper'

# Interview Class
class Interview
  def initialize
  end

  def create_flag(input)
    slow = 0
    fast = 0
    last = input.length - 1

    while (fast <= last)
      print "#{input} => F: #{fast}, S: #{slow} L: #{last}"
      puts
      if input[fast] == 'red'
        input[fast], input[slow] = input[slow], input[fast]
        fast += 1
        slow += 1

      elsif input[fast] == 'white'
        fast += 1

      elsif input[fast] == 'blue'
        input[fast], input[last] = input[last], input[fast]
        last -= 1
      end
    end

    return input

  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  # def test_one
  #   input = ['red', 'white', 'blue']
  #   assert_equal(input, @interview.create_flag(input))
  # end

  def test_two
    input = ['red', 'white', 'blue', 'red', 'white', 'blue', 'red', 'white', 'blue']
    expected = %w( red red red white white white blue blue blue)
    assert_equal(expected, @interview.create_flag(input))
  end
end
