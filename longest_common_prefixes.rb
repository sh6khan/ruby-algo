# given an array of words find the longest common prefix
# example
# [unhinged, undecidec, unbiased, unreliable] = "un"
# [carrottop, carrotcake, carrots, carrotfood] = "carrot"
require 'minitest/autorun'

def longest_common_prefix(words)
  sorted = words.sort

  first = sorted.first
  last = sorted.last

  pointer = 0
  prefix = ""
  first.split("").each do |char|
    break unless char == last[pointer]
    prefix += char
    pointer += 1
  end

  return prefix
end

describe "Longest common prefix" do
  it "should be able to find the longest common prefix" do
    words = %w(carrottop carrotcake carrots carrotfood)
    expeted = "carrot"

    prefix = longest_common_prefix(words)
    assert_equal(expeted, prefix)
  end
end
