require './test_helper'

# given a string, return the word / words that have
# been repeated the most number of times

# Interview Class
class Interview
  def initialize
  end

  def repeated_words(string)
    words = string.split(' ')
    word_count = {}

    max = 0
    words.each do |word|
      word_count[word] = 0 if !word_count[word]
      word_count[word] += 1

      max = [word_count[word], max].max
    end

    most_common_words = []

    word_count.each do |word, count|
      most_common_words.push(word) if count == max
    end

    return most_common_words
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 'word word word'
    assert_equal(['word'], @interview.repeated_words(input))
  end

  def test_two
    input = 'max word max word'
    assert_equal(['max', 'word'], @interview.repeated_words(input))
  end
end
