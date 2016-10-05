# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}

class Node
    attr_accessor :char, :children, :word

    def initialize
       @char = nil
       @children = []
       @word = nil
    end
end

class Trie
    def initialize
        @root = Node.new
        @char_map = ("a".."z").to_a
    end

    def starts_with?(string)
        node = search(string)
        !node.nil?
    end

    def found_word?(word)
        node = search(word)
        return false unless node
        node.word == word
    end

    def insert(word)
        root = @root

        word.each_char do |char|
            index = @char_map.find_index(char)

            if root.children[index]
                root = root.children[index]
                next
            end

            new_node = Node.new
            new_node.char = char
            root.children[index] = new_node
            root = new_node
        end

        root.word = word
    end

    def search(string)
        root = @root
        string.each_char do |char|
            index = @char_map.find_index(char)
            return false unless root.children[index]
            root = root.children[index]
        end

        return root
    end
end


def find_words(board, words)
    trie = Trie.new

    words.each do |word|
        trie.insert(word)
    end

    visited = Array.new(board.length) { Array.new(board.first.length) {0} }

    board.each_with_index do |row, row_index|
        row.each_with_index do |col, col_index|
            backtrack_search(board, trie, visited, row_index, col_index, "")
        end
    end
end


def backtrack_search(board, trie, visited, x, y, word)
    if x < 0 || y < 0 || x >= board.length || y >= board.first.length
        return
    end

    return if visited[x][y] == 1

    word += board[x][y]
    if !trie.starts_with?(word)
        return
    end

    if trie.found_word?(word)
        p word
    end

    visited[x][y] = 1
    backtrack_search(board, trie, visited, x+1, y, word)
    backtrack_search(board, trie, visited, x-1, y, word)
    backtrack_search(board, trie, visited, x, y+1, word)
    backtrack_search(board, trie, visited, x, y-1, word)
    visited[x][y] = 0

end
