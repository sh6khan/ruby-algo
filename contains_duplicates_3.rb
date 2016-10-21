# Given an array of integers, find out whether there are two distinct indices
# i and j in the array such that the difference between
# nums[i] and nums[j] is at most t and the difference between i and j is at most k.
#
# airbnb

require 'set'


# find the value that is the closest to
# @param value, while still being under
def max(sorted_set, value)
    previous = sorted_set.first

    sorted_set.each do |val|
       if val > value
           return previous
       end
       previous = val
    end
    return previous
end

# find the value that is closes to
# @param value while still being over
def min(sorted_set, value)
    sorted_set.each do |val|
        return val if val > value
    end
    return sorted_set.first
end



def contains_nearby_almost_duplicate(nums, k, t)
    if !nums || k <= 0
        return false
    end

    previous_k_values = SortedSet.new
    previous_k_values << nums.first

    nums.each_with_index do |num, index|
        next if index == 0

        max = max(previous_k_values, nums[index] + t)
        min = min(previous_k_values, nums[index] - t)

        #print "#{previous_k_values.each {|char| puts char}} at index #{index} with max: #{max} and min: #{min}\n"


        if max.is_a?(Integer) && (max - num <= t || num - max <= t) ||
            min.is_a?(Integer) && (min - num <= t || num - min <= t)
            #print "anser: #{max} and #{min} using #{num} at index #{index}\n"
            return true
        end

        previous_k_values << num
        if previous_k_values.length > k && index >= k
            previous_k_values.delete(nums[index - k])
        end
    end

    return false

end
