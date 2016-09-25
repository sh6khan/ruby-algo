require "set"

class Node
  def initialize(name)
    @name = name
    @adjacents = Set.new
  end

  def to_s
    @name
  end

  def can_jump_to?(other)
    other = other.to_s.split("")
    diff_count = 0
    pointer = 0

    @name.split("").each do |char|
      diff_count += 1 if other[pointer] != char
      pointer += 1
    end

    return diff_count == 1
  end
end
