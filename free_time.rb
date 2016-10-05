# Given a list of intervals for many users, i.e:
#
# A = [(1,2), (5,6)]
# B = [(1,3)]
# C = [(4,10)]
#
# Return the list of free intervals from all three, in this case would be: [(3,4)]

require 'minitest/autorun'

class Pair
  include Comparable

  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def <=>(other)
    [@start, @finish] <=> [other.start, other.finish]
  end

  def overlap?(other)
    @finish > other.start
  end

  def to_s
    "(#{@start} to #{@finish})"
  end
end

class Calendar
  # @param events Array<Pair>
  def initialize(events)
    @events = events
  end

  def find_free_time
    free_time = []

    @events.each_with_index do |event, index|
      next if index == @events.length - 1

      next_event = @events[index + 1]

      next if event.overlap?(next_event)

      free = Pair.new(event.finish, next_event.start)
      free_time << free
    end

    return free_time
  end
end


describe "Pair" do
  it "should sort" do
    pairs = []
    pairs << (pair1 = Pair.new(1,2))
    pairs << (pair2 = Pair.new(5,6))
    pairs << (pair3 = Pair.new(4,10))
    pairs << (pair4 = Pair.new(1,3))

    expected_pairs = [
      pair1,
      pair4,
      pair3,
      pair2
    ]

    assert_equal(expected_pairs, pairs.sort)
  end

  it "should be able to find some free time" do
    pairs = []
    pairs << (pair1 = Pair.new(1,2))
    pairs << (pair2 = Pair.new(5,6))
    pairs << (pair3 = Pair.new(4,10))
    pairs << (pair4 = Pair.new(1,3))

    calendar = Calendar.new(pairs.sort)
    assert_equal(calendar.find_free_time.first.start, 3)
    assert_equal(calendar.find_free_time.first.finish, 4)
  end
end
