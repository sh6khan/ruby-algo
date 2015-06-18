# given an array of ints, where each index repesents a price and each 
# element in that index is a stock price. What is the maximum profit that you 
# can obtain through buying once, and selling once.


# remeber you have to buy before you sell
# can be done in linear time and constant space

def max_profit(stock_prices)
	min_buying_point = stock_prices[0]
	max_profit = 0;

	stock_prices.each do |price|
		min_buying_point = [min_buying_point, price].min()

		current_profit = price - min_buying_point 

		max_profit = [max_profit, current_profit].max()
	end

	return max_profit
end