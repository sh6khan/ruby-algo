class Interview
  def initialize
  end
  
  def func(input)
    return input
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 1
    assert_equal(1, @interview.func(input))
  end
end

