require 'minitest/autorun'

def longest_common_substring(a, b)
  matrix = Array.new(a.length) { Array.new(b.length) {0} }

  # set the top edge
  for i in 0...b.length
    next if a[0] != b[i]
    matrix[0][i] = 1
  end

  # set the right edge
  for i in 0...a.length
    next if a[i] != b[0]
    matrix[i][0] = 1
  end

  max = {
    value: 0,
    index: 0
  }

  # fill out the rest of the matrix
  # while maintaing a max and max index
  for row in 1...a.length
    for col in 1...b.length
      next if a[row] != b[col]

      matrix[row][col] = matrix[row - 1][col - 1] + 1

      next if matrix[row][col] < max[:value]

      max = {
        value: matrix[row][col],
        index: row
      }
    end
  end

  # starting from the max index and using the max value splice
  # splice the string
  start = (max[:index] + 1) - max[:value]
  finish = max[:index]

  return a[start..finish]
end

describe "longest common substring" do
  it "abc and abcd" do
    a = "abc"
    b = "abcd"

    assert_equal("abc", longest_common_substring(a, b))
  end

  it "blackmarker and whitemarks" do
    a = "blackmarker"
    b = "whitemarks"

    assert_equal("mark", longest_common_substring(a, b))
  end

  it "test three" do
    a = "as"
    b = "whitemarks"

    assert_equal("s", longest_common_substring(a, b))
  end
end
