# given a 2D array print all the elements in a spiral order

require 'minitest/autorun'

class Interview
	def print_in_spiral(m)
		return [] if m.length == 0
		return m.first if m.length == 1

		top_length = m.length
		side_length = m[0].length


		#set boundries
		top = 0
		left = 0
		bottom = top_length - 1
		right = side_length - 1

		print_array = []

		while(left <= right && top <= bottom)

			#print top
			(left..right).each do |i|
				print_array << m[top][i]
			end
			top += 1

			#print right side
			(top..bottom).each do |i|
				print_array << m[i][right]
			end

			right -= 1


			#print bottom
			(right).downto(left).each do |i|
				print_array << m[bottom][i]
			end

			bottom -= 1


			#print left side
			(bottom).downto(top).each do |i|
				print_array << m[i][left]
			end

			left += 1
		end
		return print_array
	end
end

class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
		# test matrix
		matrix  = [[1, 2, 3,4],
				      [12, 13, 14,5],
				      [11, 16, 15,6],
				      [10, 9, 8,7]]

	  expect = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

    assert_equal(expect, @interview.print_in_spiral(matrix))
  end

	def test_two
		matrix = [[1]]
		assert_equal([1], @interview.print_in_spiral(matrix))
	end

	def test_three
		matrix = [[1],[2]]
		assert_equal([1,2], @interview.print_in_spiral(matrix))
	end
end
