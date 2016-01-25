require './test_helper'

# Implement a tic tac toe game where two NPC's play against each other
#
# x | x | x
# ---------
# 0 | 0 | 0
# ---------
# x | x | x

# A class that will act as the board object
class Board
  attr_reader :board

  def initialize
    board = Array.new(3) { Array.new(3) }
    filled_count = 0
  end

  def make_move(move, player)
    return if board[move.x][move.y]

    board[move.x][move.y] = player
    filled_count += 1
  end

  def print_board
    # print the top 2 rows of the board
    (0..2).times do |rows|
      print_row(board[row])
      puts "-" * 10
    end

    # print the bottom row of the board
    print_row(board[2])
  end

  def print_row(row)
    puts "#{row[0]} | #{row[1]} | #{row[2]}"
  end

  # returns an array of hashes indicating possible moves
  def empty_spots
    spots = []

    board.each_with_index do |row, row_num|
      row.each_with_index do |column, column_num|
        if (!row && !column)
          empty_spot = {'row' => row_num, 'column' => column_num}
          spots.push(empty_spot)
        end
      end
    end

    spots
  end

  def finished?
    filled_count == 9
  end

  def has_won?(player)
    straight?(player)|| diagonal?(player)
  end

  def horizontal?(player)
    board.each do |row|
      return true if same_values?(row)
    end

    return false
  end

  def vertical?(player)
    (0..3).times do |index|
      return true if same_values?([row[index][0], row[index][0], row[index][0]])
      return true if same_values?([row[index][1], row[index][1], row[index][1]])
      return true if same_values?([row[index][0], row[index][0], row[index][0]])
    end
  end

  def diagonal?(player)
  end

  def same_values?(possible_win)
    possible_win.uniq.length == 1
  end
end

# Interview Class
class Interview
  def initialize
  end

  def play
    board = Board.new
    player_one = 'X'
    player_two = '0'


    while (!board.finished?)

    end

  end

  def pick_random_move(moves)
    moves.sample
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 1
    assert_equal(1, @interview.func(input))
  end
end
