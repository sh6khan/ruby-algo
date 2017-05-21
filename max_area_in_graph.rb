
def find_max_area(histogram)
  index_stack = []
  max_area = 0

  index = 0
  while (index < histogram.length)
    if (index_stack.empty? || histogram[index_stack.last] <= histogram[index] )
        index_stack.push(index)
        index += 1
    else

      top = index_stack.last
      index_stack.pop

      right_index = index_stack.empty? ? index :  index - histogram[index_stack.last] - 1


      area_with_top = histogram[top] * right_index

      max_area = [max_area, area_with_top].max
    end
  end

  while (!index_stack.empty?)
    top = index_stack.last
    index_stack.pop

    right_index = index_stack.empty? ? index : index - histogram[index_stack.last] - 1
    area_with_top = histogram[top] * right_index
    max_area = [max_area, area_with_top].max
  end

  puts max_area
end

hist = [6,2,5,4,5,1,6]
find_max_area(hist)
