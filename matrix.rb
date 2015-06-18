# given a 2D array print all the elements in a spiral order



def print_in_spiral(m)

	top_length = m.length
	side_length = m[0].length


	#set boundries
	top = 0
	left = 0 
	bottom = top_length - 1
	right = side_length - 1
	

	while(left < right && top < bottom)

		#print top
		(left..right).each do |i|
			puts m[top][i]
		end
		top += 1
		
		#print right side
		(top..bottom).each do |i|
			puts m[i][right]
		end

		right -= 1
		
	
		#print bottom
		(right).downto(left).each do |i|
			puts m[bottom][i]
		end

		bottom -= 1
			

		#print left side
		(bottom).downto(top).each do |i|
			puts m[i][left]
		end

		left += 1
	end
end


# test matrix
matrix_one = [[1, 2, 3,4], 
		      [12, 13, 14,5], 
		      [11, 16, 15,6],
		      [10, 9, 8,7]]

matrix_two = [[1,2,3,4,5],
			  [16,17,18,19,6],
			  [15,24,25,20,7],
			  [14,23,22,21,8],
			  [13,12,11,10,9]]

matrix_three = [[1,2,3],
                [6,5,4],]


print_in_spiral(matrix_one)

puts
print_in_spiral(matrix_two)

puts
print_in_spiral(matrix_three)
