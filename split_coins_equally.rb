# given an array of coins (1, 5, 10, 25) can the array be split equally in terms of value

def split?(array)
  first_half = []
  first_total = 0

  second_half = []
  second_total = 0

  array.each do |num|
    if first_total <= second_total
      first_half << num
      first_total += num
    else
      second_half << num
      second_total += num
    end
  end

  return true if first_total == second_total

  if first_total < second_total
    first_total, second_total = second_total, first_total
    first_half, second_half = second_half, first_half
  end

  first_half.each do |num|
    return true if first_total - num == second_total + num
    next if first_total - num < second_total + num
    first_total -= num
    second_total += num
  end

  return false
end

puts split?([25, 25, 5, 10, 5, 10, 10, 10])
