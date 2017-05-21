require_relative 'node'

class Tree
  def initialize
    @root = nil
    @head = nil
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    else
      @root.insert(value)
    end
  end

  def print_in_order(node = @root)
    return if node.nil?

    print_in_order(node.left)

    puts node.val


    print_in_order(node.right)
  end

  def print_linked_list
    root = @head

    while (root)
      print root.val
      print " "
      root = root.next
    end

  end

  # recursively have doubly linked list
  def to_linked_list(node = @root)
    return if node.nil?

    to_linked_list(node.right)

    node.next = @head

    if (@head)
      @head.prev = node
    end

    @head = node

    to_linked_list(node.left)
  end

end
