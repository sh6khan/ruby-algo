require 'digest/sha1'

def anagram_groups(array)
  res_hash = {}
  array.each do |word|
    ascii_sum = get_ascii_sum(word)
    res_hash[ascii_sum] = [] if !res_hash[ascii_sum]
    prev_word = res_hash[ascii_sum][0]

    if !prev_word || are_anagrams(word, prev_word)
      res_hash[ascii_sum] << word
    end
  end

  res_hash.each do |key, value|
    print value
    puts ""
  end
end

def get_ascii_sum(word)
  total = 0
  word.each_byte do |byte|
    total += byte
  end

  return total * word.length;
end

def are_anagrams(word, other)
  return false if word.length != other.length

  hash = {}

  index = 0
  word.each_char do |char|
    hash[char] = 0 if !hash[char]
    hash[char] += 1
  end


  other.each_char do |char|
    return false unless hash[char] > 0
    hash[char] -= 1
  end

  return true
end

anagram_groups(["cat", "act", "bat", "bta", "aaa"])
