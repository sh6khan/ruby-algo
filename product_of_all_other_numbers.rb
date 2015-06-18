
def product_of_all_other_numbers (array)
	before_array = [1] * array.length
	after_array = [1] * array.length

	#set before_array 
	(1...array.length).each do |int|
		before_array[int] = array[int - 1] * before_array[int - 1]
	end

	#set after array
	(array.length - 2).downto(0) do |int|
		after_array[int] = array[int + 1] * after_array[int + 1]
	end

	array.each_with_index do |value, index|
		array[index] = before_array[index] * after_array[index]
	end

	array.each do |v|
		puts v 
	end
	
end

product_of_all_other_numbers([1,7,3,4])
