# Shift zeros towards end of array
# while maintianing the same ordering

def shift_zeros(array)
  count = 0

  array.each_with_index do |num, index|
    next if num == 0
    array[count] = num
    count += 1
  end

  while (count < array.length)
    array[count] = 0
    count += 1
  end

  puts array
end

array = [1,2,3,0,0,0,0,4,5,6]
shift_zeros(array)
