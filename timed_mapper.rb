# implement a mapper that with a get function that retrieves the value of a key at a particular time

class TimedMapper
  def initialize()
    @mapper = {}
  end

  def put(key, value)
    current_time = Time.now
    @mapper[key] = [] unless @mapper[key]

    @mapper[key] << {
      time: current_time,
      value: value
    }
    return current_time
  end

  def get(key, time)
    values = @mapper[key]
    return nil unless values

    values.each do |value|
      put_time = value[:time]
      if time <= put_time
        return value[:value]
      end
    end

    return nil
  end
end

timed_mapper = TimedMapper.new

first_time = timed_mapper.put("key", 1)
second_time = timed_mapper.put("key", 2)
third_time = timed_mapper.put("key", 3)

puts timed_mapper.get("key", second_time)
puts timed_mapper.get("random", second_time)
