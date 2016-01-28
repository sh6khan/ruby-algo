require './test_helper'

# Interview Class
class Interview
  def initialize
  end

  def find_rectangular_overlap(square_one, square_two)
    x_overlap = find_overlap(square_one.x, square_one.width, square_two.x, square_two.width)
    y_overlap = find_overlap(square_one.y, square_one.length, square_two.y, square_two.width)

    return nil if !x_overlap[1] || !y_overlap[1]

    # build hash
  end

  def find_overlap(point1, length1, point2, length2)

    end_point1 = point1 + length1
    end_point2 = point2 + length2

    max_start_point = [point1, point2].max
    min_end_point = [end_point1, end_point1].min

    overlap = max_start_point - min_end_point
    overlap_points = overlap > 0 ? [max_start_point, overlap] : [nil, nil]

    overlap_points
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = 1
    assert_equal(1, @interview.func(input))
  end
end
