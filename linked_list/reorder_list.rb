class Node
  attr_accessor :next, :val
  def initialize(val)
    @val = val
    @next = nil
  end
end

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def print_list(node)

    while (node)
      print node.val + " "
      node = node.next
    end
    puts
  end

  def reverse_list(node)
    prev = nil
    next_node = nil

    curr = node
    while(curr)
      next_node = curr.next
      curr.next = prev
      prev = curr
      curr = next_node
    end

    return prev
  end


  def rearrange
    slow = @head
    fast = slow.next
    while (fast != nil && fast.next != nil)
      slow = slow.next
      fast = fast.next.next
    end

    first_half_node = @head
    second_half_node = slow.next
    slow.next = nil
    second_half_node = reverse_list(second_half_node)

    print_list(first_half_node)
    print_list(second_half_node)

    while (first_half_node && second_half_node)
      next_first = first_half_node.next
      next_second = second_half_node.next

      first_half_node.next = second_half_node
      second_half_node.next = next_first

      second_half_node = next_second
      first_half_node = next_first
    end
  end
end

ll = LinkedList.new()

ll.head = Node.new("A")
ll.head.next = Node.new("B")
ll.head.next.next = Node.new("C")
ll.head.next.next.next = Node.new("D")
ll.head.next.next.next.next = Node.new("E")

ll.print_list(ll.head)
ll.rearrange
ll.print_list(ll.head)
