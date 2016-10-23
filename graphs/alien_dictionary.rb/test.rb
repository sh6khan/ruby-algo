require_relative 'alien_dictionary_decoder'
require 'minitest/autorun'

describe "AlienDictionaryDecoder"  do
  it "should determine alphabet based on words" do
    words = [
      "wrt",
      "wrf",
      "er",
      "ett",
      "rftt"
    ]

    add = AlienDictionaryDecoder.new(words)
    add.topo_sort
    p add.alphabet
  end
end
