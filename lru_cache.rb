# design a hash map that is also an LRU cache

# MRU = most recently used
# LRU = least recently used
# @cache = [1(MRU) ,2,3,4,5, 6(LRU)]

class LRUCacheMap
  def initialize(capacity)
    @capacity = capacity
    @cache = []
    @hash = {}
  end

  def get(key)
    return -1 if !@hash[key]

    # Move the Key to MRU
    @cache.delete(key)
    @cache = [key] + @cache

    @hash[key]
  end

  def set(key, value)
    deleted = @cache.delete(key)

    if (deleted)
      # The key is in the cache and therefore needs to be moved
      # to the front of the cache. The @hash does not change
      @cache = [key] + @cache

    elsif @cache.length < @capacity
      # The key is not in the cache, but the cache also still has space
      # therefore we can add the key to the MRU and add the key value to @hash
      @cache = [key] + @cache
      @hash[key] = value

    elsif @cache.length == @capacity
      # The key is not in the cache and we are at capacity
      # delete the final element in the cache (LRU) and from the @hash
      # then add the new key in the front of the cache and add the new
      # key value pair into the @hash

      # removing the LRU
      lru = @cache.last
      @cache.pop
      @hash[key] = nil

      # adding new MRU
      @cache = [key] + @cache
      @hash[key] = value
    else
      # Raise an error
      raise StandError, @cache.length
    end

  end

end
