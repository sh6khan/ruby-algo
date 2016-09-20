class PriorityQueue
  def initialize
    @queue = {}
  end

  def any?
    @queue.any?
  end

  def return_queue
    @queue
  end

  def enqueue(key, value)
    @queue[key] = value
    @queue.sort_by { |_key, value| value }
  end

  def dequeue
    @queue.shift.first
  end
end
