

def carrots_eaten(matrix)
  row, col = find_middle(matrix)

  total = 0

  while row < matrix.length && col < matrix.first.length && row >= 0 && col >= 0
    total += matrix[row][col]
    matrix[row][col] = 0

    max = {
      val: 0,
      row_col: []
    }

    # check above
    if matrix[row - 1] &&   max[:val] < matrix[row - 1][col]
      max[:val] = matrix[row - 1][col]
      max[:row_col] = [row - 1, col]
    end

    # check below
    if matrix[row + 1] &&  max[:val] < matrix[row + 1][col]
      max[:val] = matrix[row + 1][col]
      max[:row_col] = [row + 1, col]
    end

    # check right
    if matrix[row][col + 1] &&  max[:val] < matrix[row][col + 1]
      max[:val] = matrix[row][col + 1]
      max[:row_col] = [row, col + 1]
    end

    # check left
    if matrix[row][col - 1] && max[:val] < matrix[row][col - 1]
      max[:val] = matrix[row][col - 1]
      max[:row_col] = [row, col - 1]
    end

    # if max val is 0 then there is nothing left to eat
    if max[:val] == 0
      return total
    end

    row = max[:row_col][0]
    col = max[:row_col][1]
  end

  return total

end

def find_middle(matrix)
    # find the middle in a non even matrix
    row = 0
    col = 0
    row_exact = false
    col_exact = false

    if matrix.length % 2 != 0
        row_exact = true
        row = matrix.length / 2
    end

    if matrix.first.length % 2 != 0
        col_exact = true
        col = matrix.first.length / 2
    end

    # both are exact
    return [row, col] if row_exact && col_exact

    # one or the other is exact
    if row_exact
        col += 1 if matrix[col + 1] && matrix[col] < matrix[col + 1]
        return [row, col]
    end

    if col_exact
        row += 1 if matrix[row + 1] && matrix[row][col] < matrix[row + 1][col]
        return [row, col]
    end

    # neither are exact middles
    top_left = matrix[row][col]

    if col + 1 < matrix.first.length
      top_right = matix[row][col + 1]
    else
      top_right = 0
    end

    if row - 1 >= 0
      bottom_left = matrix[row - 1][col]
    else
      bottom_left = 0
    end

    if row - 1 >= 0 && col + 1 >= matrix.first.length
      bottom_right = matrix[row - 1][col + 1]
    else
      bottom_right = 0
    end


    max = [top_left, top_right, bottom_left, bottom_right].max

    return [row, col] if max == top_left
    return [row, col + 1] if max == top_right
    return [row - 1, col] if max == bottom_left
    return [row - 1, col + 1]  if max == bottom_right
end


arr = [[5, 7, 8, 6, 3],
 [0, 0, 7, 0, 4],
 [4, 6, 3, 4, 9],
 [3, 1, 0, 5, 8]]

p carrots_eaten(arr)
