# build a game of secret santa
# if personA cannot be the santa for personB if they
# have the same last name

require 'minitest/autorun'

class Person
  attr_reader :last, :first, :santa_for
  attr_accessor :santa

  def initialize(first, last)
    @first = first
    @last = last
    @santa_for = nil
    @santa = nil
  end

  def invalid_santa?
    @last == @santa_for.last
  end

  def related?(person)
    @last == person.last
  end

  def assign_santa(person)
    @santa_for = person
    person.santa = self
  end

  def to_s
    "#{@first} #{@last}"
  end
end

class Game
  attr_reader :members

  def initialize
    @members = []
  end

  def add_memeber(person)
    @members << person
  end

  def reveal
    @members.each do |person|
      puts "#{person.first} #{person.last} is santa for #{person.santa_for.first} #{person.santa_for.last}"
    end
  end

  def valid_group?
    family_count = {}
    max = 0

    @members.each do |person|
      family_count[person.last] ||= 0
      family_count[person.last] += 1

      max = [family_count[person.last], max].max
    end

    return false if max > @members.length / 2
    return true
  end

  def shuffle
    @members.shuffle
  end

  def assign_santas
    @members.each_with_index do |person, index|
      reciever_index = index + 1
      # circle back
      if index == @members.length - 1
        reciever_index = 0
      end

      gift_reciever = @members[reciever_index]
      while (person.related?(gift_reciever) || !gift_reciever.santa.nil?)
        reciever_index += 1
        reciever_index = reciever_index % @members.length
        gift_reciever = @members[reciever_index]
      end

      person.assign_santa(gift_reciever)

    end
  end
end

describe "Secret Santa" do
  it "assign every one a santa" do
    person1 = Person.new("Steve", "Jobs")
    person2 = Person.new("Tim", "cook")
    person3 = Person.new("Jack", "Dorsey")
    person4 = Person.new("Bill", "Gates")
    person5 = Person.new("Bob", "Dylan")
    person6 = Person.new("Paul", "Allen")
    person7 = Person.new("Thomas", "Eddison")
    person8 = Person.new("Jeff", "Bezos")
    person9 = Person.new("Larry", "Page")

    game = Game.new

    game.add_memeber(person1)
    game.add_memeber(person2)
    game.add_memeber(person3)
    game.add_memeber(person4)
    game.add_memeber(person5)
    game.add_memeber(person6)
    game.add_memeber(person7)
    game.add_memeber(person8)
    game.add_memeber(person9)

    game.shuffle
    game.assign_santas

    #game.reveal

    assert_equal(true, game.valid_group?)
  end

  it "should be able to identify an invalid group" do
    person1 = Person.new("Steve", "Jobs")
    person2 = Person.new("Tim", "Jobs")
    person3 = Person.new("Jack", "Jobs")
    person4 = Person.new("Bill", "Jobs")
    person5 = Person.new("Bob", "Jobs")
    person6 = Person.new("Paul", "Allen")
    person7 = Person.new("Thomas", "Eddison")
    person8 = Person.new("Jeff", "Bezos")
    person9 = Person.new("Larry", "Page")

    game = Game.new

    game.add_memeber(person1)
    game.add_memeber(person2)
    game.add_memeber(person3)
    game.add_memeber(person4)
    game.add_memeber(person5)
    game.add_memeber(person6)
    game.add_memeber(person7)
    game.add_memeber(person8)
    game.add_memeber(person9)

    assert_equal(false, game.valid_group?)
  end

  it "should be able to swap" do
    person1 = Person.new("Steve", "Jobs")
    person2 = Person.new("Tim", "cook")
    person3 = Person.new("Jack", "Dorsey")
    person4 = Person.new("Bill", "Gates")
    person5 = Person.new("Bob", "Dylan")

    game = Game.new

    game.add_memeber(person1)
    game.add_memeber(person2)
    game.add_memeber(person3)
    game.add_memeber(person4)
    game.add_memeber(person5)
  end

  it "should re assign families" do
    person1 = Person.new("Steve", "Jobs")
    person2 = Person.new("Tim", "Jobs")
    person3 = Person.new("Jack", "Jobs")
    person4 = Person.new("Bill", "Jobs")
    person5 = Person.new("Bob", "Dylan")
    person6 = Person.new("Paul", "Allen")
    person7 = Person.new("Thomas", "Eddison")
    person8 = Person.new("Jeff", "Bezos")
    person9 = Person.new("Larry", "Page")

    game = Game.new

    game.add_memeber(person1)
    game.add_memeber(person2)
    game.add_memeber(person3)
    game.add_memeber(person4)
    game.add_memeber(person5)
    game.add_memeber(person6)
    game.add_memeber(person7)
    game.add_memeber(person8)
    game.add_memeber(person9)

    game.assign_santas

    game.reveal
  end
end
