
class Event
  attr_accessor :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def overlap(event)
    return start <= event.start && finish <= event.finish && finish >= event.start
  end

  def can_absorbe(event)
    return start <= event.start && finish >= event.finish
  end

  def can_be_absorbed_by(event)
    return start >= event.start && finish <= event.finish
  end

  def to_s
    "(#{start} to #{finish})"
  end
end

class Calendar
  attr_accessor :stack

  def initialize(events)
    @events = events
    @stack = []
    @stack << events.first
  end

  def simplify

    @events.each do |event|
      past_event = stack.pop

      next if past_event == nil

      if past_event.overlap(event)
        new_event = Event.new(past_event.start, event.finish)
        stack.push(new_event)

      elsif past_event.can_absorbe(event)
        stack.push(past_event)

      elsif past_event.can_be_absorbed_by(event)
        stack.push(event)
      else
        stack.push(past_event)
        stack.push(event)
      end
    end

    puts stack
  end


end


events = []
events.push(Event.new(1,3))
events.push(Event.new(2,4))
events.push(Event.new(5, 6))
events.push(Event.new(5,7))

cal = Calendar.new(events)
cal.simplify
