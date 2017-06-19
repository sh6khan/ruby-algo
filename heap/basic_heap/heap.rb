class Heap

  def initialize(size)
    @arr = Array.new(size)
    @position = 0
  end

  def left_child(index)
    2*index + 1
  end

  def right_child(index)
    2*index + 2
  end

  def left_child_value(index)
    return @arr[left_child(index)]
  end

  def right_child_value(index)
    return @arr[right_child(index)]
  end

  def parent(index)
    (index - 1) / 2
  end

  def parent_value(index)
    return @arr[parent(index)]
  end


  def insert(val)
    @arr[@position] = x
    @position += 1
    bubble_up unless @position == 0
  end

  def bubble_up
    pos = @position
    while (pos > 0 && parent_value(pos) > @arr[pos])
      @arr[pos], parent_value(pos) = parent_value(pos), @arr[pos]
      pos = pos / 2
    end
  end


  def extract_min
    
  end
end
