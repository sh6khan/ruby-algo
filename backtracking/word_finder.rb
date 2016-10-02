# given a temp dictionary find all the words that can be created from an input string without
# re-arranging the letters.
# example 1)
# hotelfate
# [[hot, elf, ate], [hotel, fate]]
#
# aaa
# [[a,a,a]]

require 'minitest/autorun'
require 'set'


class WordFinder
  attr_reader :all_valid_subwords

  VALID_WORDS = %W(hot elf ate at a hotel fate)

  def initialize
    @valid_words = Set.new
    @all_valid_subwords = []

    VALID_WORDS.each do |word|
      @valid_words << word
    end
  end

  def is_word(word)
    @valid_words.include?(word)
  end

  def words_within(input, used_words)

    # handle base case of edge nodes
    # return true if edge node and is valid
    if is_word(input.join)
      used_words << input.join
      @all_valid_subwords << used_words
      return
    end



    # iterate through each letter building up any possible word
    # i.e. we are not at a valid edge node
    current_word = []
    input.each_with_index do |char, index|
      current_word << char

      next unless is_word(current_word.join)

      # now I branch
      left_over = input.drop(index + 1)
      used_words << current_word.join

      words_within(left_over, used_words)

      used_words = []
    end
  end
end


describe "WordFinder" do
  it "should work" do
    word_finder = WordFinder.new
    word_finder.words_within("hotelfate".split(""), [])

    expected = [
      ["hot", "elf", "ate"],
      ["hotel", "fate"],
    ]

    assert_equal(expected, word_finder.all_valid_subwords)
  end

  it "should handle case with ending issue" do
    word_finder = WordFinder.new
    word_finder.words_within("catx".split(""), [])

    expected = [
    ]

    assert_equal(expected, word_finder.all_valid_subwords)
  end

  it "should handle repeated words" do
    word_finder = WordFinder.new
    word_finder.words_within("hothot".split(""), [])

    expected = [
      ["hot","hot"]
    ]

    assert_equal(expected, word_finder.all_valid_subwords)
  end
end
