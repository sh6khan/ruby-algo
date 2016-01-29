class Cell

  attr_reader :x , :y, :world

  def initialize(word, x, y)
    @world = word
    @x = x
    @y = y

    @alive = false
  end

  def alive?
    @alive
  end

  def dead?
    !@alive
  end

  def live!
    @alive = true
  end

  def die!
    @alive = false
  end

  def toggle!
    @alive = !@alive
  end

  def all_neigbours
    n = []

    n.push(world.cell_at(x + 1, y + 1))
    n.push(world.cell_at(x, y + 1))
    n.push(world.cell_at(x + 1, y))

    n.push(world.cell_at(x - 1, y - 1))
    n.push(world.cell_at(x, y -1 ))
    n.push(world.cell_at(x - 1, y))

    n.push(world.cell_at(x + 1, y - 1))
    n.push(world.cell_at(x - 1, y + 1))

    n.push
  end

  def live_neigbours
    all_neigbours.select do |n|
      n && n.alive?
    end

    all_neigbours.length
  end


end