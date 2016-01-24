class Interview
  def initialize
    @server_names = {}
  end

  def alloc(name)
    if (@server_names[name])
      @server_names[name] += 1
      return name + @server_names[name].to_s
    else
      @server_names[name] = 1
      return name + @server_names[name].to_s
    end
  end

  def dealloc(name)
    raise "wtf" if (!@server_names[name])

    @server_names[name] -= 1

    return 'empty' if @server_names[name] == 0

    return name + @server_names[name].to_s
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 'first'
    assert_equal('first1', @interview.alloc(input))

    input = 'first'
    assert_equal('first2', @interview.alloc(input))    

    input = 'first'
    assert_equal('first1', @interview.dealloc(input))

    input = 'second'
    assert_equal('second1', @interview.alloc(input))

    input = 'second'
    assert_equal('second2', @interview.alloc(input))

    input = 'first'
    assert_equal('empty', @interview.dealloc(input))
  end
end

