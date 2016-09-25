require 'minitest/autorun'

class Node
  include Comparable

  attr_reader :priority

  def initialize(name, priority)
    @name = name
    @priority = priority
  end

  def <=>(other)
    @priority <=> other.priority
  end

  def to_s
    @name
  end
end

class PriorityQueue
  attr_reader :queue

  def initialize
    @queue = [nil]
  end

  def <<(node)
    @queue << node
    bubble_up(@queue.length - 1)
  end

  def pop
    exchange(1, @queue.length - 1)
    max = @queue.pop
    bubble_down(1)
    return max
  end

  private

  def bubble_up(index)
    return if index <= 1

    parent_index = index / 2

    return if @queue[parent_index] >= @queue[index]

    exchange(parent_index, index)
  end

  def bubble_down(index)
    child_index = index * 2

    return if child_index > @queue.length - 1

    left_child_index = child_index
    right_child_index = child_index + 1

    left_child = @queue[left_child_index]
    right_child = @queue[right_child_index]

    # grab the child index of the larger children
    if left_child && right_child
      child_index = left_child > right_child ? left_child_index : right_child_index
    elsif left_child && !right_child
      child_index = left_child_index
    elsif !left_child && right_child
      child_index = right_child_index
    end

    return if @queue[index] >= @queue[child_index]

    exchange(index, child_index)

    bubble_down(child_index)
  end

  def exchange(index_a, index_b)
    @queue[index_a], @queue[index_b] = @queue[index_b], @queue[index_a]
  end
end

describe "PriorityQueue" do
  it "should be able to insert and pop" do
    node1 = Node.new("1", 1)
    node2 = Node.new("2", 2)
    node3 = Node.new("3", 3)
    node4 = Node.new("4", 4)
    node5 = Node.new("5", 5)
    node6 = Node.new("6", 6)
    node7 = Node.new("7", 7)
    node8 = Node.new("8", 8)

    pq = PriorityQueue.new

    pq << node1
    pq << node2
    pq << node7
    pq << node4
    pq << node6
    pq << node3

    node = pq.pop
    assert_equal(node7, node)

    node = pq.pop
    assert_equal(node6, node)

    node = pq.pop
    assert_equal(node4, node)

    node = pq.pop
    assert_equal(node3, node)
  end
end
