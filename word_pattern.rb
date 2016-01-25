require './test_helper'

# Interview Class
class Interview
  def initialize
  end

  def same_pattern(pattern, string)
    pattern = pattern.split('')
    string = string.split(' ')
    return false if pattern.length != string.length

    pattern_hash = {}

    pattern.each_with_index do |letter, index|
      word = string[index]
      return false if pattern_hash[letter] != pattern_hash[word]

      pattern_hash[letter] = index
      pattern_hash[word] = index
    end

    true
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_accept
    string = 'cat dog dog cat'
    pattern = 'abba'
    assert_equal(true, @interview.same_pattern(pattern, string))

    string = 'cat dog dog dog'
    pattern = 'baaa'
    assert_equal(true, @interview.same_pattern(pattern, string))
  end

  def test_reject
    string = 'cat dog dog fish'
    pattern = 'abba'
    assert_equal(false, @interview.same_pattern(pattern, string))

    string = 'cat dog dog fish'
    pattern = 'aaaa'
    assert_equal(false, @interview.same_pattern(pattern, string))
  end
end
