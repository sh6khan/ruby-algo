def three_sum(array, target)
  array.each do |num|
    left_over = target - num
    result = two_sum(array, left_over, num)
    next if !result

    return result << num
  end
end

def two_sum(array, target, exclude)
  hash = {}
  excluded = false

  array.each do |num|
    hash[num] = 0 if !hash[num]
    hash[num] += 1

    if (num == exclude && !excluded)
      exclude = true
      hash[num] -= 1
    end

    left_over = target - num
    if (left_over == num)
      return [num, num] if hash[num] >= 2
    else
      return [num, left_over] if hash[left_over] && hash[left_over] >= 1
    end
  end

  return nil
end

puts two_sum([1,3,5, 5], 10, 5)
puts three_sum([1,3,5,9,10, 10], 29)
