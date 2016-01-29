require 'minitest/autorun'
require 'set'

# remove duplicates from a linked list

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
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

    while(current_node)

      if (current_node.next == nil)
        current_node.next = new_node
        return
      end

      current_node = current_node.next
    end
  end


  def remove_duplicates!
    dup_set = Set.new

    # the prev follows the current
    prev = nil
    current = @head

    while(current)
      if (dup_set.include?(current.value))
        prev.next = current.next
      else
        dup_set.add(current.value)
        prev = current
      end

      current = current.next
    end


  end
end

class Test < MiniTest::Test
  def setup
    @linked_list = LinkedList.new
  end

  def test_insert
    @linked_list.insert(1)
    @linked_list.insert(2)
    @linked_list.insert(3)
    @linked_list.insert(3)
    @linked_list.insert(4)

    assert_equal(@linked_list.head.value, 1)
    assert_equal(@linked_list.head.next.value, 2)
    assert_equal(@linked_list.head.next.next.value, 3)
    assert_equal(@linked_list.head.next.next.next.value, 3)
    assert_equal(@linked_list.head.next.next.next.next.value, 4)
  end


  def test_remove_duplicates
    @linked_list.insert(1)
    @linked_list.insert(2)
    @linked_list.insert(3)
    @linked_list.insert(3)
    @linked_list.insert(3)
    @linked_list.insert(3)
    @linked_list.insert(4)

    @linked_list.remove_duplicates!

    assert_equal(@linked_list.head.value, 1)
    assert_equal(@linked_list.head.next.value, 2)
    assert_equal(@linked_list.head.next.next.value, 3)
    assert_equal(@linked_list.head.next.next.next.value, 4)
  end
end