require_relative 'trie'
require 'minitest/autorun'

describe "Trie" do
  it "should be able to insert" do
    trie = Trie.new

    trie.insert("water")
    trie.insert("waterloo")
    trie.insert("at")
    trie.insert("life")
    trie.insert("wait")
    trie.insert("later")
  end

  it "should be able to find the longest common prefix" do
    trie = Trie.new

    trie.insert("water")
    trie.insert("waterloo")
    trie.insert("wait")
    trie.insert("wall")

    assert_equal("wa",trie.longest_common_prefix)

    trie = Trie.new

    trie.insert("carrottop")
    trie.insert("carrotcake")
    trie.insert("carrotlove")
    trie.insert("carrotlite")
    trie.insert("carrotright")

    assert_equal("carrot",trie.longest_common_prefix)

    trie = Trie.new

    trie.insert("ca")
    trie.insert("cc")
    trie.insert("cb")
    trie.insert("cd")
    trie.insert("ce")

    assert_equal("c",trie.longest_common_prefix)

    trie.insert("de")

    assert_equal("",trie.longest_common_prefix)
  end
end
