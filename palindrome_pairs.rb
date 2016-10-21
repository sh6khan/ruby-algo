# find all pairs of strings in an array that when conconated is
# a plaindromic string
# airbnb

def palindrome_pairs(words)
  rev_map = {}
  res = []
  # store the reverse of each string in hash
  words.each_with_index do |word, index|
    rev_string = word.reverse
    rev_map[rev_string] = index
  end


  words.each_with_index do |word, index|


    # handle empty strings
    if palindrome?(word) && rev_map[""] && rev_map[""] != index
      puts word + ""
      res << [index, rev_map[""]]
    end


    if rev_map[word] && rev_map[word] != index
      puts word + word.reverse
      res << [index, rev_map[word]]
    end


    #grab all the prefix's of a string
    # and suffix
    for i in 0..(word.length - 1)
      prefix = word[0..i]
      suffix = word[(i+1)..word.length - 1]
      #print "#{prefix}, #{suffix} \n"

      if rev_map[prefix] && palindrome?(suffix) && rev_map[prefix] != index
        pair = [index, rev_map[prefix]]
        puts word + prefix.reverse
        res << pair
      end

      if rev_map[suffix] && palindrome?(prefix) && rev_map[suffix] != index
        pair = [rev_map[suffix], index]
        puts suffix.reverse + word
        res << pair
      end
    end
  end

  return res
end

def palindrome?(word)
  return false if word.nil? || word.empty?
  word.reverse == word
end

words = ["abcd", "dcba", "lls", "s", "sssll"]
p palindrome_pairs(words)
