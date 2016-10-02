# A child is running up a stair case with n steps and can hop either 1 step, 2 steps, or 3 steps
# at a time. How many ways can the child climpb up n steps

require 'minitest/autorun'

class StepCounter
  def initialize
    @memo = {}
    @memo[0] = 1
  end

  def ways_to_climb_to_step(n)
    # handle the base cases
    return @memo[n] if @memo[n]

    if n < 0
      return 0
    else
      @memo[n] = ways_to_climb_to_step(n - 1) + ways_to_climb_to_step(n - 2) + ways_to_climb_to_step(n - 3)
      return @memo[n]
    end
  end
end

describe "StepCounter" do
  it "should count dem steps" do
    sc = StepCounter.new
    assert_equal(180396380815100901214157639, sc.ways_to_climb_to_step(100))
  end
end
