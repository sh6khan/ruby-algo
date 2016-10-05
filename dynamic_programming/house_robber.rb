# given an array of integers representing the value of value of a house
# return the maximum amount you can rob, without robbing two consecutive houses
# ex)
# houses = [2,1,1,2]
# return 4 (rob the first house and the last one)

require 'minitest/autorun'

class HouseRobber
  def initialize(houses)
    @memo = {}
    @houses = houses
  end

  def rob_house(house_number)
    return @memo[house_number] if @memo[house_number]

    # base cases
    if house_number == 0
      return @houses.first
    elsif house_number == 1
      @memo[1] = [@houses[0], @houses[1]].max
      return @memo[1]
    end

    @memo[house_number] = [
      @houses[house_number] + rob_house(house_number - 2),
      rob_house(house_number - 1)
    ].max

    return @memo[house_number]
  end
end

describe "HouseRobber" do
  it "should determine the best houses to rob" do
    houses = [2,1,1,2,5,8,3,2,1]
    house_robber = HouseRobber.new(houses)

    assert_equal(14, house_robber.rob_house(houses.length - 1))
  end
end
