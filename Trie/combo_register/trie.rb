require_relative 'node'
require 'set'

class Trie
  def initialize
    @starting_roots = Set.new
    @char_map = ('a'..'z').to_a
    @pointer = nil
  end

  def on_key(char)
    puts "on_key #{char}"
    # find the starting root
    if !@pointer
      @starting_roots.each do |node|
        if node.val == char
          @pointer = node
          return
        end
      end
    end

    if !@pointer
      puts "could not find ponter"
      return
    end

    i = @char_map.find_index(char)

    if @pointer.child[i]
      @pointer = @pointer.child[i]
      puts "got combo #{@pointer.terminator}" if @pointer.terminator
    else
      puts "failed combo"
      @pointer = nil
    end

  end

  def reset
    @pointer = nil
  end

  def register(keys, name)
    root = nil

    # get starting root node
    @starting_roots.each do |node|
      if node.val == keys[0]
        root = node
      end
    end

    if !root
      root = Node.new(keys[0])
      @starting_roots.add(root)
    end

    # build the Trie
    for k in 1...keys.length
      char = keys[k]
      i = @char_map.find_index(char)

      if !root.child[i]
        temp = Node.new(char)
        root.child[i] = temp
        root = temp
      else
        root = root.child[i]
      end
    end

    # set the combo name as the terminator
    root.set_combo(name)
    puts "registered #{keys} under #{root.terminator} #{root.val}"
  end
end
