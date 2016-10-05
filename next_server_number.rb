require './test_helper'

# Interview Class
class Interview
  attr_reader :name_count

  def initialize
    @name_count = {}
  end

  def next_server_number(names)
    sorted_names = counting_sort(names)

    missing_num = 1
    sorted_names.each do |val|
      return missing_num if missing_num != val
      missing_num += 1
    end

    return missing_num
  end

  def counting_sort(names)
    count_arr = []
    new_arr = []

    names.each do |name|
      count_arr[name] = 1
    end

    count_arr.each_with_index do |count, num|
      next unless count
      new_arr << num
    end

    return new_arr
  end

  def allocate(host_type)
    if !name_count[host_type]
      name_count[host_type] = []
    end

    num = next_server_number(name_count[host_type])
    name_count[host_type].push(num)
    host_type + num.to_s
  end

  def deallocate(host_name)
    split_name = host_name.scan(/\d+|\D+/)

    host_type = split_name[0]
    num = split_name[1].to_i

    raise 'does not e' if !name_count[host_type] || !name_count[host_type].include?(num)

    name_count[host_type].delete(num)
  end
end

# Tests
class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_one
    input = [5, 3, 1]
    assert_equal(2, @interview.next_server_number(input))
  end

  def test_two
    input = [2, 3, 4, 5]
    assert_equal(1, @interview.next_server_number(input))
  end

  def test_three
    input = [1, 2, 3, 4, 5]
    assert_equal(6, @interview.next_server_number(input))
  end

  def test_four
    input = []
    assert_equal(1, @interview.next_server_number(input))
  end

  def test_allocate
    name = 'apibox'
    assert_equal('apibox1', @interview.allocate(name))

    name = 'apibox'
    assert_equal('apibox2', @interview.allocate(name))

    name = 'apibox1'
    @interview.deallocate(name)

    name = 'apibox'
    assert_equal('apibox1', @interview.allocate(name))
  end
end
