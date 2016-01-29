# base class for single linked list

require 'minitest/autorun'

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class SingleLinkedList
  attr_reader :head, :size

  def initialize()
    @head = nil
    @size = 0
  end

  def add(value)
    if !@head
      @head = Node.new(value)
      return
    end

    current = @head

    while(current.next != nil)
      current = current.next
    end

    current.next = Node.new(value)
    @size += 1
  end

  def delete_at(index)
    return nil if (index > @size - 1)

    current = @head

    if (index == 0)
      @head = @head.next
      return
    end

    count = 0
    prev = nil

    while(count < index)
      prev = current
      current = current.next
      count += 1
    end

    prev.next = current.next
    @size -= 1

    return_as_array
  end

  def delete_val(val)
    current = @head
    prev = nil

    while(current.next != nil)
      if current.value == val
        prev.next = current.next
      else
        prev = current
      end

      current = current.next
    end

    # acount for the very last element
    if (current && current.value == val)
      prev.next = nil
    end


    return_as_array
  end

  def return_as_array
    visual_array = []

    current = @head

    while(current)
      visual_array.push(current.value)
      current = current.next
    end

    visual_array
  end

end

class Test < MiniTest::Test
  def setup
    @single_linked_list = SingleLinkedList.new
  end

  def test_add
    @single_linked_list.add(1)
    @single_linked_list.add(2)
    @single_linked_list.add(3)

    expected_list = [1,2,3]

    assert_equal(expected_list, @single_linked_list.return_as_array)

    expected_list = [2,3]
    @single_linked_list.delete_at(0)

    assert_equal(expected_list, @single_linked_list.return_as_array)

    @single_linked_list.add(4)
    @single_linked_list.add(5)
    @single_linked_list.add(6)

    @single_linked_list.delete_at(1)
    assert_equal([2,4,5,6], @single_linked_list.return_as_array)


    assert_equal(nil, @single_linked_list.delete_at(10))

    assert_equal([2,4,5], @single_linked_list.delete_at(3))

     @single_linked_list.add(6)
     @single_linked_list.add(7)
     @single_linked_list.add(8)

     assert_equal([2,5,6,7,8], @single_linked_list.delete_val(4))
     assert_equal([2,5,6,7], @single_linked_list.delete_val(8))

  end
end
