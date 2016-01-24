# A key value store with history, implelemented with timestamps

class Interview
  def initialize
    @main_hash = {}
  end

  def set(key, value)
    current_time = Time.new.to_i
    @main_hash[key] ? @main_hash[key][current_time] = value : @main_hash[key] = {current_time => value};
    return current_time
  end

  def get(key, timestamp = nil)
    timestamp == nil ? get_most_recent(key) : get_timestamp_value(key, timestamp)
  end

  private

  def get_most_recent(key)
    @main_hash[key].values.last
  end

  def get_timestamp_value(key, timestamp)
    return @main_hash[key][timestamp]
  end
end

require 'minitest/autorun'

class Tests < MiniTest::Test
  def setup
    @interview = Interview.new
  end

  def test_key_value_store
    key = 'first_key'
    value = 'first_value'
    @interview.set(key, value)
    assert_equal('first_value', @interview.get('first_key'))
  end

  def test_adding_same_key
    key = 'key'
    f_value = 'f_value'
    s_value = 's_value'

    @interview.set(key, f_value)
    sleep 1
    @interview.set(key, s_value)

    assert_equal('s_value', @interview.get('key'))
  end

  def test_searching_with_timestamp
    key = 'key'
    f_value = 'f_value'
    s_value = 's_value'

    set_time = @interview.set(key, f_value)
    sleep 1
    @interview.set(key, s_value)

    assert_equal('f_value', @interview.get('key', set_time))
  end

end

