require 'mintest/autorun'

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

  def add(value)
    new_node = Node.new(value)

    if !@head
      @head = new_node
      return
    end

    current = @head

    while(current.next != nil)
      current = current.next
    end

    current.next = new_node
  end

  def delete_node(node)
    # next_node = node.next
    # node.value = next_node.value
    # node.next = next_node.next

    node.value = node.next.value
    node.next = node.next.next
  end

  def return_as_array
    arr = []

    current = @head
    while(current)
      arr.push(current.value)
      current = current.next
    end

    arr
  end
end

class Test < MiniTest::Test
  def setup
    @linked_list = LinkedList.new
  end

  def test_one
    @linked_list.add(1)
    @linked_list.add(2)
    @linked_list.add(3)
    @linked_list.add(4)

    # Node.value == 3
    node = @linked_list.head.next.next

    @linked_list.delete_node(node)
  end

  def test_two
  end
end