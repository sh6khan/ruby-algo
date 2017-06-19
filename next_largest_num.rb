def next_largest_num(num)
  arr = num.chars.map(&:to_i)

  last_index = arr.length - 1
  swap = 0

  (last_index).downto(0) do |i|
    runner = i

    while (runner > 0 && arr[runner] >= arr[i])
      runner -= 1
    end

    if runner == 0 && i != 0
        next
    end

    if runner == 0 && i == 0
      break
    end


    swap = runner
    arr[runner], arr[i] = arr[i], arr[runner]
    break
  end


  max = 999999999
  max_index = 1

  if (swap == 0)
    for i in 1...arr.length
      if max > arr[i]
        max = arr[i]
        max_index = i
      end
    end

    arr[0], arr[max_index] = arr[max_index], arr[0]
  end

  swap += 1
  arr[swap..last_index] = arr[swap..last_index].sort!

  return arr.join('')
end

puts next_largest_num("534976")
puts next_largest_num("399")
