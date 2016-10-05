require 'minitest/autorun'
require_relative 'trie'


describe "Trie" do
  it "should be able to insert a word into the trie" do
    trie = Trie.new

    trie.insert("water")
    trie.insert("waterloo")
    trie.insert("at")
    trie.insert("life")
    trie.insert("wait")
    trie.insert("later")
  end

  it "should be able to find words inserted into the trie" do
    trie = Trie.new

    trie.insert("water")
    trie.insert("waterloo")
    trie.insert("at")
    trie.insert("life")
    trie.insert("wait")
    trie.insert("later")

    assert_equal(true, trie.contains_word?("water"))
    assert_equal(true, trie.contains_word?("waterloo"))
    assert_equal(true, trie.contains_word?("wait"))
    assert_equal(true, trie.contains_word?("later"))
    assert_equal(false, trie.contains_word?("jobs"))
  end

  it "should be able to fidn all words that start with a prefix" do
    trie = Trie.new

    trie.insert("water")
    trie.insert("waterloo")
    trie.insert("at")
    trie.insert("life")
    trie.insert("wait")
    trie.insert("later")


    assert_equal(["wait","water","waterloo"], trie.all_words_that_start_with("wa"))
  end
end
