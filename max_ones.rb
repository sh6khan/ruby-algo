# given a string representation of a binary number, find a contigous block of bits
# such that flipping those bits will result in the maximum number of 1's

# return the total maximum number of 1's



def max_ones(n)
	binary_array = n.split('')

	current_ones_counter = 0
	current_zeros_counter = 0

	total_ones_counter = 0
	
	max_profit = 0
	current_profit = 0

	binary_array.each do |num|

		if (current_zeros_counter < current_ones_counter)
			current_ones_counter = 0 
			current_zeros_counter = 0 
		end

		if num == "1"
			total_ones_counter += 1
			current_ones_counter += 1 
		else 
			current_zeros_counter += 1
		end


		current_profit = current_zeros_counter - current_ones_counter

		max_profit = [max_profit, current_profit].max
			 
	end

	return total_ones_counter + max_profit
end

puts max_ones("10010010")