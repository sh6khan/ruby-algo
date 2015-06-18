# Given an unsorted list, sort the list in less than O(nlog(n)) time
# i.e. faster than merge sort


def counting_sort(unorderd_list, highest_number)
	element_counter = [0] * (highest_number +1)

	
	unorderd_list.each do |i|
		element_counter[i] += 1
	end

	sorted_list = []

	element_counter.each_with_index do |number, index|
		number.times do 
			sorted_list << index
		end
	end


	# printing out the new sorted list
	sorted_list.each do |i|
		puts i
	end

end


counting_sort([3,2,4,5,6,1,2,3,5,6,7,3,5,6], 10)