# given a total sum an an array of coin values, find the minimum
# number of coins that add up to the total sum

require 'minitest/autorun'

class CoinCounter
  def initialize(coins)
    @memo = {}
    @coins = coins.sort
  end

  def min_coin_counter(sum)
    # set the inital base cases
    return @memo[sum] if @memo[sum]

    if sum == 0
      return 0
    end

    values = []

    @coins.each do |coin_value|
      next if sum - coin_value < 0
      values << (min_coin_counter(sum - coin_value) + 1)
    end

    @memo[sum] = values.min
    return @memo[sum]

  end
end

describe "CoinCounter" do
  it "should return the min number of coins where possible" do
    coins = [5,3,1]
    coin_counter = CoinCounter.new(coins)

    assert_equal(3, coin_counter.min_coin_counter(11))
  end
end
