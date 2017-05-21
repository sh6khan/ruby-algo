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

    # handle base case
    if is_word(input.join)
      used_words << input.join
      @all_valid_subwords << used_words
      return
    end

    current_word = []
    input.each_with_index do |char, index|
      current_word << char

      next if !is_word(current_word.join)

      used_words << current_word.join

      # this is where we branch
      left_over = input.drop(index + 1)
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
