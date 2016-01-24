class Interview

  def next_server_number(server_names)
    sorted_names = counting_sort(server_names)

    # 0(n)
    sorted_names.each_with_index do |server_name_count, index|
      next if index == 0
      return index if (server_name_count == 0)
    end

  end

  def counting_sort(server_names)
    max = server_names.max  # O(n)
    new_array = [0] * (max + 2)


    server_names.each do |name| # O(n)
      new_array[name] += 1
    end

    return new_array
  end

end

require 'minitest/autorun'

class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    server_names = [1,2,3]
    assert_equal 4, @interview.next_server_number(server_names)
  end

  def test_two
    server_names = [2,3,4,5]
    assert_equal 1, @interview.next_server_number(server_names)
  end

  def test_three
    server_names = [1,2,3,9]
    assert_equal 4, @interview.next_server_number(server_names)
  end
end


