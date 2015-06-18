#given a string determine if it is possible the string can be re-arranged to make a palindrome


def possible_palindrome(string)
	duplicate_hash = {}
	middle_char = true

	char_counter = 0

	string.each_char do |char|
		if duplicate_hash[char] == false
			duplicate_hash[char] = !duplicate_hash[char]
			char_counter += 1
		else
			duplicate_hash[char] = false
			char_counter -= 1
		end
	end 

	if char_counter == (-1 || 0) 
		return 1 
	else 
		return 0
	end


end

puts possible_palindrome('ivicc')