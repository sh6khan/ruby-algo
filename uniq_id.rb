# given an array of ints where every element has 1 duplicate element, Except for 1.
# Find the 1 uniq int in the array of ints


#assuming that there is always 1 uniq int

def find_uniq_int(array)
	uniq_id = 0

	array.each do |element|
		uniq_id ^= element
	end 

	return uniq_id
end

puts find_uniq_int([1,2,1,6,2,5,5])