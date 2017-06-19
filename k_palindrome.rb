def is_k_palindrome(word, k)
  reverse_word = word.reverse
  index = 0
  diff_count = 0

  while (index < word.length)
    diff_count += 1 if word[index] != reverse_word[index]
    index += 1
  end

  return diff_count <= k
end

puts is_k_palindrome("abcdecba", 1)
