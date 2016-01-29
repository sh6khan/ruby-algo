require 'minitest/autorun'

class Node
  attr_accessor :value, :next, :prev

  def initialize(value, next_node = nil, prev = nil)
    @value = value
    @next = next_node
    @prev = prev
  end
end


class SortedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def insert(new_value)
    new_node = Node.new(new_value)

    if !@head
      @head = new_node
      return
    end

    current_node = @head

    while (current_node && current_node.value < new_value)

      # insert into the end of the list
      if !current_node.next
        current_node.next = new_node
        new_node.next = nil
        new_node.prev = current_node
        return
      end

      if current_node.next && current_node.next.value > new_value
        new_node.next = current_node.next
        new_node.prev = current_node

        current_node.next = new_node

        new_node.next.prev = new_node
      end

      current_node = current_node.next
    end

  end
end

class Test < MiniTest::Test
  def setup
    @sorted_list = SortedList.new
  end

  def test_sorted_insert
    @sorted_list.insert(1)
    @sorted_list.insert(3)
    @sorted_list.insert(10)
    @sorted_list.insert(2)

    assert_equal(@sorted_list.head.value, 1)
    assert_equal(@sorted_list.head.next.value, 2)
    assert_equal(@sorted_list.head.next.next.value, 3)
    assert_equal(@sorted_list.head.next.next.next.value, 10)
  end
end