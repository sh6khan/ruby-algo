require 'minitest/autorun'

class Cell
  def initialize
    @value = nil
  end

  def empty?
    @value.nil?
  end

  def fill(value)
    @value = value
  end

  def to_s
    @value
  end
end

class Grid
  def initialize(x, y)
    @x = x
    @y = y

    @grid = Array.new(x) { Array.new(y) {Cell.new} }
  end

  def set_cell(x, y, value)
    @grid[x][y].fill(value)
  end

  def print_grid
    @grid.each do |row|
      print row.map(&:to_s)
      puts ""
    end
  end

  def highest_point_for_col(col)
    row = 0

    while row < @x
      return row unless @grid[row][col].empty?
      row += 1
    end

    return @x - 1
  end

  def highest_point(start_col, end_col)
    row = @x - 1
    (start_col..end_col).each do |col_num|
      row = [highest_point_for_col(col_num), row].min
    end
    return row
  end

  def fits?(row, col, block)
    return false if row - block.height < 0
    return false if col + block.width > @y - 1
    return true
  end

  def place_block(block, col)
    return false if col + block.width > @y - 1
    row = highest_point(col, block.width + col)
    return unless fits?(row - 1, col, block)

    fill_block(row, col, block)
    print_grid
  end

  def fill_block(row, col, block)
    row_start = row - block.height
    col_end = col + block.width

    (row_start...row).each do |row|
      (col...col_end).each do |col|
        #puts "#{row} #{col}"
        set_cell(row, col, block.to_s)
      end
    end
  end
end


class Block
  attr_reader :height, :width

  def initialize(name, height, width)
    @name = name
    @height = height
    @width = width
  end

  def to_s
    @name
  end
end

describe "Game" do
  it "should be able to find the highest point" do
    grid = Grid.new(10, 10)
    grid.set_cell(5,5, "1")
    grid.set_cell(9, 0, "1")

    row = grid.highest_point_for_col(5)
    assert_equal(5, row)

    row = grid.highest_point_for_col(0)
    assert_equal(9, row)
  end

  it "should be able to find the highest point given a range of columns" do
    grid = Grid.new(10, 10)
    grid.set_cell(5,5, "1")
    grid.set_cell(5,4, "1")
    grid.set_cell(5,6, "1")
    grid.set_cell(4,5, "1")

    row = grid.highest_point(0, 9)
    assert_equal(4, row)
  end

  it "should make sure it fits" do
    grid = Grid.new(10, 10)
    block3 = Block.new("BLock1", 5,5)

    fits = grid.fits?(4, 3, block3)
    assert_equal(false, fits)

    fits = grid.fits?(9, 3, block3)
    assert_equal(true, fits)

    fits = grid.fits?(9, 7, block3)
    assert_equal(false, fits)

    fits = grid.fits?(9, 4, block3)
    assert_equal(true, fits)
  end

  it "should be able to fill block" do
    grid = Grid.new(10, 10)
    block1 = Block.new("1", 4,4)
    block2 = Block.new("2", 4,4)
    grid.fill_block(9,2, block1)

    grid.place_block(block2, 0)

    #grid.print_grid
  end
end
