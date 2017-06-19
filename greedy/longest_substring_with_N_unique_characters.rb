def longest_substring_with_unique_chars(str, n)
  start = 0
  fin = 0

  curr_u_count = 0
  curr_s_count = 0
  hash = {}
  max = 0

  while (fin < str.length)
    char = str[fin]

    if curr_u_count == n
      max = [max, curr_s_count].max
    end

    if !hash[char]
      curr_u_count += 1
      hash[char] = 0
    end

    hash[char] += 1
    curr_s_count += 1

    if curr_u_count > n
      while hash[str[start]] > 1
        hash[str[start]] -= 1
        start += 1
        curr_s_count -= 1
      end

      curr_u_count -= 1
    end


    fin += 1

  end

  max = [max, curr_s_count].max

  puts max
end


longest_substring_with_unique_chars("aaabbb", 3)
