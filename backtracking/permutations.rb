# given an array, find all permutations

@all = []
def perms(nums, visited, current)
  if current.length == nums.length
    print "#{current}\n"
    @all << current.join
  end

  for x in 0...nums.length
    next if visited[x]

    visited[x] = true
    current << x

    perms(nums, visited, current)

    current.pop
    visited[x] = false
  end
end

perms([1,2,3,4], {}, [])
print "#{@all} \n"
