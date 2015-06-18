# given a string, return the smallest string
# that is a palindrome with the original string as a substring
# example: 
#    given: abcd
#	 return: bcdadcb
#	 given aaaccaaaa
#	 return: aaaaccaaaaa

# this implementation has not been tested


def new_palindrome(word)
	array_word = word.split(//)

	appendable = []

	# I forgot what I wrote for this question and i dont feel like 
	# writing it all out right now

	# but the idea was to remove the letters from the end of the original
	# word until the original word was a palindrome

	# each time you removed a letter, you push it onto a new stack

	# you then return the sum of both stacks

	# example: abcd

	# remove_and_push_to_stack = abc -> d
	# isPalindrome?(abc)

	# remove_and_push_to_stack = ab -> cd
	# isPalindrome?(ab)

	# remove_and_push_to_stack = a -> bcd
	# isPalindrome?(a)

	# YES is palindrome !

	# now return the new string, the last element is simply the reverse of the first element

	# bcd + a + dcb
	
end

