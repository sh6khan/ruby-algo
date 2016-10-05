
# given a 2D array return the area of the maximum array that only contains 1's
# [
#   [0,1,0,1,1,0],
#   [1,1,0,0,1,0],
#   [1,1,0,1,1,0],
#   [1,0,1,1,1,0],
#   [0,1,0,0,1,0]
# ]

def find_max_square(matrix)
  max_matrix = Array.new(matrix.length) {Array.new(matrix.first.length) {0} }

  # set the edges
  max_matrix[0] = matrix.first.split("").map(&:to_i)
  max_matrix.each_with_index do |row, index|
    row[0] = matrix[index][0].to_i
  end

  total_max = 0

  max_matrix.each_with_index do |row, row_index|
    next if row_index == 0
    row.each_with_index do |col, col_index|
      next if col_index == 0 || matrix[row_index][col_index] == "0"

      left = max_matrix[row_index][col_index - 1]
      top = max_matrix[row_index - 1][col_index]
      top_left = max_matrix[row_index - 1][col_index - 1]

      new_value = [left, top, top_left].min + 1
      max_matrix[row_index][col_index] = new_value

      print_matrix(max_matrix)

      total_max = [new_value, total_max].max
    end
  end

  return total_max
end

def print_matrix(matrix)
  matrix.each do |row|
    print "#{row} \n"
  end
  puts ""
end

arr = [
"10100",
"10111",
"11111",
"10010"
]

p find_max_square(arr)
