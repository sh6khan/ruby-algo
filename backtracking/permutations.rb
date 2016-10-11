# given an array, find all permutations

def perms(all, nums, visited, current)
  if current.length == nums.length
    all << current.join
  end

  for x in 0...nums.length
    next if visited[x]

    visited[x] = true
    current << x

    perms(all, nums, visited, current)

    current.pop
    visited[x] = false
  end
end

all = []
current = []
perms(all, [1,2,3,4], {}, current)
print "#{all} \n"
