# given a 2d array of letters and a word.
# determine if you can find the word in the board of letters

require 'minitest/autorun'

class WordSearch
  def initialize(board, word)
    @board = board
    @word = word
  end

  # retrun a boolean
  def backtrack_search?(row, col, letters)

    #handle the base case
    if letters.join == @word
      return true
    end

    # handle edge node that is wrong
    if letters.length == @word.length
      return false
    end

    # validate word so far
    pointer = 0
    letters.each do |char|
      return false if char != @word[pointer]
      pointer += 1
    end

    # check above
    if @board[row - 1]
      letters << @board[row - 1][col]

      if (backtrack_search?(row - 1, col, letters))
        return true
      end

      letters.pop
    end

    # check below
    if @board[row + 1]
      letters << @board[row + 1][col]

      if (backtrack_search?(row + 1, col, letters))
        return true
      end

      letters.pop
    end


    # check right
    if @board[row][col + 1]
      letters << @board[row][col + 1]

      if (backtrack_search?(row, col +1, letters))
        return true
      end

      letters.pop
    end

    # check left
    if @board[row][col - 1]
      letters << @board[row][col - 1]

      if (backtrack_search?(row, col - 1, letters))
        return true
      end

      letters.pop
    end

  end

  def search_word
    starting_letter = @word[0]
    letters = []

    @board.each_with_index do |_row, row_index|
      _row.each_with_index do |_col, col_index|
        char = @board[row_index][col_index]

        next unless char == starting_letter

        letters << char
        # row and col of current letter
        # current letters in the array
        if (backtrack_search?(row_index, col_index, letters))
          return true
        end

        letters = []
      end
    end

    return false
  end
end

describe "it should be able to find words in the board" do
  before do
    @board = [
      ['A','B','C','E'],
      ['S','F','E','S'],
      ['A','D','E','E']
    ]

    word = "ABCESEEEFS"
  end

  it "should find" do

    word = "FCEE"

    ws = WordSearch.new(@board, word)
    assert_equal(true, ws.search_word)
  end

  it "should find ABCE" do
    word = "ABCE"

    ws = WordSearch.new(@board, word)
    assert_equal(true, ws.search_word)
  end

  it "should not find AA" do
    word = "AA"

    ws = WordSearch.new(@board, word)
    assert_equal(true, ws.search_word)
  end
end
