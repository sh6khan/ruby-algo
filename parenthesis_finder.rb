#given a string, and the index of a openening '('. Return the index of the closing ')'

def closing_paren(string, index)
	counter = 0
	position = index + 1

	while(position < string.length)

		if string[position] === '('
			counter += 1
		elsif string[position] === ')' 
			return position	 if counter === 0
			counter -= 1
	    end 

	    position += 1

	end

	return 'Closing Paren not found'
end


