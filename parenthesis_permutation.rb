require 'minitest/autorun'


def find_all_perms(n)
  all = []

  return all if n == 0

  helper(all, '', n, n)

  return all
end

def helper(all, present, open_count, close_count)
  puts "#{present} : close_count = #{close_count}, open_count = #{open_count}"
  if close_count == 0
    all << present
  end

  if open_count > 0
    helper(all, present + "(", open_count - 1, close_count)
    puts "finished #{all.last} : close_count = #{close_count}, open_count = #{open_count}"
  end

  if close_count > open_count
    helper(all, present + ")", open_count, close_count - 1)
  end
end

describe "test" do
  it "should return all perms" do
    find_all_perms(3)
  end
end
