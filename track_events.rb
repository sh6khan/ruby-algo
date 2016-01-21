# create a function that can track the number of
# times the number has been called 


class EventTracker
    def initialize()
        @events = []
        @five_minute_pointer = 0
        @five_minute_ref = (5 * 60)
    end

    def track_event
        current_time = Time.now.to_i
        @events.push(current_time)

        five_minute_value = current_time - @five_minute_ref

        # move the 5 minute pointer  untill it reaches the point where the previous element was
        # 5 minutes ago

        @events.length.times do |index|
            @events[index] < five_minute_value ? @events.delete_at(index) : return
        end
    end

    def collect_stats
        return @events.length
    end

end

tracker = EventTracker.new

10.times do 
    puts 'adding a new event'
    tracker.track_event

    sleep 1
end

puts tracker.collect_stats

