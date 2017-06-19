def product_perm(list)
  res = []
  helper(res, list, [], 0, list.length)
  return res
end

def helper(res, list, curr, i, k)
  if curr.length <= k && curr.length > 0
    prod = 1
    curr.each do |num|
      prod *= num
    end
    res << prod
  end

  return if curr.length > k

  while (i < list.length)
    helper(res, list, curr + [list[i]], i + 1, k)
    i += 1
  end
end

print product_perm([2,3,5])
