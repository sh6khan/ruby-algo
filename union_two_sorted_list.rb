def union_two_lists(small, big)
  small, big = big, small if small.length > big.length

  si = 0
  bi = 0

  while (si < small.length && bi < big.length)
    if small[si] == big[bi]
      si += 1
      bi += 1
      next
    end

    if (small[si] > big[bi])
      bi += 1
    else
      small[si] = nil
      si += 1
    end
  end

end

small = [1, 3, 5, 8, 9]
big = [1, 2, 4, 6, 7, 9]

union_two_lists(small, big)
print small
