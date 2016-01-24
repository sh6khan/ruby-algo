class Interview
  def initialize
  end
  
  def func(string)
    count = 0
    compressed_string = []
    while (count < string.length)
      runner_count = 0
      runner = count;

      while(string[count] == string[runner])
        runner_count += 1
        runner += 1
      end

      if runner_count == 1
        compressed_string.push(string[count]) 
      else 
        compressed_string.push(string[count], runner_count) 
      end


      count = runner
    end

    return compressed_string.join()
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 'aaabwwwwwssssee'
    assert_equal('a3bw5s4e2', @interview.func(input))
  end

  def test_two
    input = 'abcd'
    assert_equal('abcd', @interview.func(input))
  end
end

