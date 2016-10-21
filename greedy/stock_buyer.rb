# Say you have an array for which the ith element is the price of a given stock on day i.
# If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock),
# design an algorithm to find the maximum profit.


# the basic idea here is to use a greedy approach
# Most greedy approaches are O(n)

# keep track of a max so far
# reset your comparotor if we have a situation where we can
# garuntee will not be the max
def max_profit(stocks)
  max = 0
  buy = stocks[0]

  stocks.each_with_index do |sell, index|
    # ignore the first index just because already set it above
    next if index == 0

    current_profit = sell - buy

    # if the current profit is less than 0, there is no way the
    # prices could possibly be used to generate the max profit
    # therefore start making new comparisons from this point
    # forward
    if current_profit < 0
      buy = sell
    end

    # evaluate the max everytime
    max = [max, current_profit].max
  end

  if max == 0
    return -1
  end

  return max
end

require 'minitest/autorun'

describe "Greedy Profit" do
  it "should be able to find the max profit" do
    stocks = [1,2,3,4,5,6,7]
    assert_equal(6, max_profit(stocks))
  end
end
