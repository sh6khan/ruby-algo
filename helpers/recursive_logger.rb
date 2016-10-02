# this is a helper class that makes it to keep track of recuresive calls
class Scrolls
  def self.success_solve_node(indent, arg)
    puts " "*indent + " " + arg + " Success"
  end

  def self.entering_new_node(indent, arg)
    puts " "*index + " entering: " + arg
  end
end
