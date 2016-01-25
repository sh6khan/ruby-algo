require './test_helper'

# If every student had to have at least one 1 candy and if
# two students are right next to each other, then the student with
# the higher grade should get more candy
# minimize the candy distributions following the above rules

# Interview Class
class Interview
  def initialize
  end

  def give_candy(marks)
    candy_allocator = [1] * marks.length
    reverse_candy_allocator = [1] * marks.length

    # loop the first time in regular order
    marks.each_with_index do |_mark, index|
      next if index == 0
      allocate(index, candy_allocator, marks)
    end

    # loop through the second time in reverse orders
    # always take the max of the two possible values
    marks.reverse.each_with_index do |_mark, index|
      next if index == 0
      allocate(index, reverse_candy_allocator, marks)
    end

    candy_ditrb = final_distribution(candy_allocator, reverse_candy_allocator)
    total_candy_needed(candy_ditrb)
  end

  # Always look at the previos mark to determine how much candy
  # is needed for the current position
  def allocate(index, allocator, marks)
    prev = index - 1

    allocator[index] = allocator[prev] + 1 if marks[index] > marks[prev]
    allocator[index] = allocator[index] if marks[index] == marks[prev]

    allocator
  end

  # compare the reverse_candy_allocator and candy_allocator
  # need to take the max at each element to ensure proper rules
  def final_distribution(first, second)
    candy_distribution = []

    first.each_with_index do |candy, index|
      candy_distribution.push([candy, second[index]].max)
    end

    candy_distribution
  end

  # return the total number of candy needed
  def total_candy_needed(candy_distribution)
    candy_distribution.inject do |s, x|
      s + x
    end
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = [10, 2, 4, 2, 6, 1, 7, 8, 9, 2, 1]
    assert_equal(19, @interview.give_candy(input))
  end
end
