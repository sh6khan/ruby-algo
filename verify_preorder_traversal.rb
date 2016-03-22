require './test_helper'

class Stack
  attr_accessor :top, :store

  def initialize
    @top = -1
    @store = []
  end

  def push(value)
    store.push(value) 
    top += 1
  end


  def pop
    store.pop
    top -= 1
  end

  def peek
    store[top]
  end

  def peek_second
    store[top - 1]
  end
end

# Interview Class
class Interview

  attr_accessor :stack

  def initialize
    @stack = Stack.new
  end

  def verify(preorder)
    preorder = preorder.split(',')

    preorder.each do |element|
      stack.push(element.to_s)

      while(two_consecutive_hashes?)
        stack.pop
        stack.pop
        
        return false if sta
        stack.pop
        stack.push("#")
      end
    end

    stack.peek == '#'
  end

  def two_consecutive_hashes?
    stack.peek_second == '#' && stack.peek == '#')
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
