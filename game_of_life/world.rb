require './cell'

class World
  def initialize(rows, columns)
    @cells = []

    columns.each do |x|
      @cells.push([])

      rows.each do |y|
        @cells[x].push(Cell.new(self, x, y))
      end
    end
  end

  def all_cells
    @cells.flatten
  end

  def cell_at(x, y)
    @cell[x][y] if @cell[x]
  end

  def next_generation!
    # if alive and should stay alive in the next round, ignore
    affected = []

    all_cells.each do |cell|
      # dies by overcrowding or by under population
      if ((cell.live_neigbours > 3 || cell.live_neigbours < 2) && cell.alive?)
        affected.push(cell)
      end

      # born becuase of reproduction
      if (cell.dead? && cell.live_neigbours == 3)
        affected.push(cell)
      end
    end

    affected.each(&:toggle!)
    return
  end
end