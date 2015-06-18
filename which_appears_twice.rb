# given an array of ints that all appear once in the range of 1..n, find the 1 number that appears twice

def double_finder(array_of_nums)
	total = 0

	array_of_nums.each do |nums|
		total += nums
	end

	length = array_of_nums.length - 1

	expected_total = (length * (length + 1)) / 2

	double = total - expected_total 
end