# given a word, find all permuations of the chars of that word


def all_perms(current, word, visited)
  if current.length == word.length
    puts current.join('')
    return
  end

  for index in 0...word.length
    next if visited[index]

    visited[index] = true
    current << word[index]

    all_perms(current, word, visited)

    current.pop
    visited[index] = false
  end
end

all_perms([], "word", {})
