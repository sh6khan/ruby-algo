=begin
	
	Question: given two numbers, & (binary operation) all the numbers together
			  do it as effeciently as possible
	
=end

def binary_and_range(start, stop)

	# n & n = n
	# n & 0 = 0
	if start == stop || start == 0 
		return start
	end


	# if n is a power of two
	# n & (n-1) = 0 
	# there fore the entire range comes out to 0

	power_of_two = 1
	while power_of_two < stop
		if power_of_two > start & power_of_two <= stop
			return 0
		end
	end

	# nothing left to do other than just manually & the numbers in the range
	total = start
	((start + 1)..stop).each do |i|
		total &= i
	end

	return total
end