require_relative 'trie'
require 'minitest/autorun'

describe "Contoller" do
  it "should register combos" do
    controller = Trie.new
    controller.register("abcd", "kick")

    controller.on_key("a")
    controller.on_key("b")
    controller.on_key("c")
    controller.on_key("d")
  end
end
