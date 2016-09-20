# given a string s and a dictionary of words
# determine if s can be segmented into a list of comma seperated words
# that are all part of the dictionary
#

# example
# s = "allthelightwecannotsee"
# dict = ['all', 'the', 'light', 'we', 'cannot', 'see']
# return true
#

require 'minitest/autorun'

class WordIndentifier
  def initialize
  end

  def break_word(word, dict)
    char_array = word.split("")
    sucessfull_word = [nil] * (word.length + 1)
    sucessfull_word[0] = true

    char_array.each_with_index do |char, index|
      j = 0
      while j < index
        substring = word[j...index]
        if dict.include?(substring) && sucessfull_word[j]
          sucessfull_word[index] = true
          break
        end
        j += 1
      end
    end

    return sucessfull_word[word.length]

  end
end

class Tests < MiniTest::Test
  def setup
    @word_identifier = WordIndentifier.new
  end

  def test_one
    word = "allthelightwecannotsee"
    dict = %w(all the light we cannot see)

    assert_equal(true, @word_identifier.break_word(word, dict))

    word = "allthelightwecannotsee"
    dict = %w(all the light we cannot)
    assert_equal(false, @word_identifier.break_word(word, dict))
  end

end
