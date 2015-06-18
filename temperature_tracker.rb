# design  a stack class that keeps track of temperature
# shold return mean, max, mode, and min
# all return functions should be constant time
# Insert functions can be slower


class TempTracker 
	attr_accessor :main_stack, :total, :min, :max, :mode

	def initialize()
		@mode_tracker = [0] * (110) #all possible value of ferinhieght
		@total = 0 
		@min = 0
		@max = 0
		@mode = [0,0] #[value, occurences]
	end

	def insert(value)


		mode_tracker[value] += 1

		max = [max, value].max()
		min = [min, value].max()

		if mode_tracker[value] > mode[1]
			mode[1] = mode_tracker[value]
			mode[0] = value

		mean += value
	end

	def peek(stack)
		return stack[stack.length]
	end

	def get_mean
		return total / main_stack.length
	end

	def get_min
		return min
	end

	def get_max
		return max 
	end

	def get_mode
	end
end
