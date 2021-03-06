# given a simple array of arrays, buy n number of bit coins such that you minimize the cost
# the first element: price
# the second element: amount available
# the third element: dn wrry about it



asks = [["230.62","4.14509998",10],["230.64","0.0100016",1],["230.68","0.85",1],["230.69","0.16391896",1],["230.71","0.0509",3],["230.72","0.0125",1],["230.73","0.0125",1],["230.74","0.0125",1],["230.75","0.0125",1],["230.76","0.0125",1],["230.77","0.0125",1],["230.78","0.0125",1],["230.79","0.0125",1],["230.8","0.0125",1],["230.81","3.18641",2],["230.82","0.7625",2],["230.83","0.55889652",3],["230.84","2.0125",2],["230.85","0.57371634",1],["230.86","0.0125",1],["230.87","2.799837",3],["230.88","6.3794689",2],["230.89","0.0125",1],["230.9","0.0125",1],["230.91","0.0125",1],["230.92","0.0125",1],["230.93","0.0125",1],["230.94","0.0125",1],["230.95","0.25837843",2],["230.96","2.8335",2],["230.97","0.0125",1],["230.98","0.0125",1],["230.99","0.0125",1],["231","0.0125",1],["231.01","0.0125",1],["231.02","0.0125",1],["231.03","0.0125",1],["231.04","0.12390302",3],["231.05","17.43012388",3],["231.06","0.0125",1],["231.07","0.0125",1],["231.08","1.02333356",2],["231.09","0.0125",1],["231.1","0.0125",1],["231.11","0.16275904",2],["231.12","0.0125",1],["231.13","0.1015444",3],["231.14","2.5155",2],["231.15","4.27143",2],["231.16","0.0125",1]]

def buy_btc(n, asks)
	bought = 0
	total_cost = 0

	asks.each do |ask|

		current_cost = ask[0].to_f
		buyable = ask[1].to_f

		if (bought + buyable > n)
			buyable = n - bought
		end

		total_cost += current_cost * buyable
		bought += buyable

		if bought == n
			return total_cost
		end
	end

	return total_cost
end

puts buy_btc(10, asks)




