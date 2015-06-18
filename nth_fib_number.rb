# find the nth fib number.
# do it in 3 ways
# recursion
# recursion with memoziation
# itterativly

def find_fib(n)
	if n == 0 || n == 1
		return n

	prev = 1
	prev_prev = 0

	n.times do |index|
		current = prev + prev_prev
		prev = prev_prev
		prev_prev = current
	end

	return current
end

find_fib()