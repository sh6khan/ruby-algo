require './test_helper'

# Interview Class
class Interview
  def initialize
  end

  def overlap(input)
    input
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 1
    assert_equal(1, @interview.func(input))
  end
end
