require './test_helper'

# Find the longest substring with K unique characters in
# given string

# Interview Class
class Interview
  def initialize
  end

  def longest_substring(input, k)

  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = "aabbcc"
    k = 1

    assert_equal(["aa", "bb", "cc"], @interview.longest_substring(input, k))
  end

  def test_two
    input = "aabbcc"
    k = 2

    assert_equal(1, @interview.longest_substring(input, k))
  end
end
