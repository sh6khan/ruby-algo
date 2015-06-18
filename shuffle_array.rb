# shuffle an array in place

def shuffle(the_array)
	len = (the_array.length - 1)

	while (len > 0)
		random = rand(0..len)
		the_array[len], the_array[random] = the_array[random], the_array[len]
		len -= 1
	end

	the_array.each do |s|
		puts s
	end
end

array = [1,2,3,4,5,6,7,8,9,0,12,13,14,15]
shuffle(array)