def is_one_edit_apart(a,b)
  acceptable_diff = true

  return false if (a.length - b.length).abs > 1

  if a.length == b.length
    for i in 0...a.length
      if a[i] != b[i]
        return false unless acceptable_diff
        acceptable_diff = false
      end
    end

    return true
  else
    hash = {}
    a,b = b,a if a.length > b.length



    for i in 0...a.length
      hash[b[i]] ||= 0
      hash[a[i]] ||= 0

      hash[b[i]] += 1
      hash[a[i]] -= 1
    end

    hash[b[b.length - 1]] ||= 0
    hash[b[b.length - 1]] += 1



    puts hash

    hash.each do |key, value|
      return false if value <= -1
      if value > 1
        return false if acceptable_diff
        acceptable_diff = false
      end
    end

    return true
  end
end

puts is_one_edit_apart("aab", "aa")
