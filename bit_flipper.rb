# given an int, return the binary flipped int of that that number
# example: given 32
#   32 = 100000
#   flipped = 011111
# return 31 

def bit_flipper (n)
	new_binary = 0
	binary = n.to_s(2).to_i

	length = binary.to_s.length

	length.times do 
		new_binary = new_binary << 1 | (binary & 1) ^ 1
		binary >>= 1
	end

	new_binary = new_binary.to_s(2).reverse!
	return  new_binary.to_i(2)
	
end

puts bit_flipper(100)