require './test_helper'

# Interview Class
class Tracker
  attr_reader :name_count

  def initialize
    @name_count = {}
  end

  def allocate(host_type)
    if (name_count[host_type])
      name_count[host_type] += 1
      return host_type + name_count[host_type].to_s
    else
      name_count[host_type] = 1
      return host_type + 1.to_s
    end
  end

  def deallocate(host_name)
  end

end

# Tests
class Tests < MiniTest::Test
  def setup
    @tracker = Tracker.new
  end

  def test_one
    input = 1
    assert_equal(1, @tracker.allocate(input))
  end
end
