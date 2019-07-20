 class LRUCache
    def initialize(limit)
        @cache = []
        @limit = limit
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if exists?(el)
        accessed(el)
        return
      end

      if self.count < @limit
        @cache << el
      else
        @cache.shift
        @cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
      nil
    end

    private
    # helper methods go here!
    def exists?(el)
        @cache.include?(el)
    end

    def accessed(el)
        @cache.delete_at(@cache.index(el))
        @cache << el
    end

  end

  johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]