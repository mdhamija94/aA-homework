class Map
    def initialize
        @map = []
    end

    def set(key, value)
        pair_position = map.index { |pair| pair[0] == key }

        if pair_position.nil?
            map.push([key, value])
        else
            map[pair_position][1] = value 
        end
    end

    def get(key)
        map.each do |pair|
            return pair[1] if pair[0] == key
        end

        nil
    end

    def delete(key)
        map.reject! do |pair|
            pair.first == key
        end
    end

    def show
    end

    private
    attr_accessor :map
end

map = Map.new
map.set(1,2)
map.set(3,4)
map.set(4,5)
map.set(1,3)
p map