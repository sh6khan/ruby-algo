def insert(arr, num)
  arr << num
  i = arr.length - 1
  while i > 1 and arr[i] > arr[i/2]
    arr[i], arr[i/2] = arr[i/2], arr[i]
    i = i/2
  end
end

arr = [0]
insert(arr, 3)
insert(arr, 6)
insert(arr, 4)
insert(arr, 8)
insert(arr, 4)
insert(arr, 7)

print arr
