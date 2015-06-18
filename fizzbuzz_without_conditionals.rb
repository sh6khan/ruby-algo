# Every one knows FizzBuzz 
# Do fizzbuzz with no conditionals


# there are multiple ways to do this one, This is what I came up with 
# while the interviewer guided me through this

def fizz_buzz_no_cons
	possible_fizz = [1, 0, 0]
    possible_buzz = [2, 0, 0, 0, 0]
    words = [None, "Fizz", "Buzz", "FizzBuzz"]
 
    n.times do |i|
        words[0] = i
        puts(words[possible_fizz[i%3] + possible_buzz[i%5]])
    end
 
end