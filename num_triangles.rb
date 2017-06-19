# the definition of a triangle is given by 


def num_triangles(array)
  array = array.sort
  count = 0

  for i in 0...array.length
    k = i + 2

    for j in (i+1)...array.length

      while k < array.length && array[i] + array[j] > array[k]
        k += 1
      end

      count += ((k-1) - j)
    end
  end

  return count
end

puts num_triangles([1, 2, 5, 4, 3, 18, 12, 7, 6])
