fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'] 
#=> "fiiiissshhhhhh"

# Sluggish Octopus O(n^2)

def sluggish_octopus(fish)
    longest_fish = fish.first

    (0...fish.length).each do |start|
        (start...fish.length).each do |ending|
            if fish[ending].length > fish[start].length 
                longest_fish = fish[ending]
            else
                longest_fish = fish[start]
            end
        end
    end

    longest_fish
end

# Dominant Octopus O(n log n)

def dominant_octopus(fish)
    merge_sort(fish)[-1]
end

def merge_sort(fish)
    return fish if fish.length <= 1

    mid = fish.length / 2

    left = fish[0...mid]
    right = fish[mid..-1]

    left_sort = dominant_octopus(left)
    right_sort = dominant_octopus(right)

    merge(left, right)
end

def merge(left, right)
    merged = []

    until left.empty? || right.empty?
        if left.first < right.first
            merged << left.shift
        else
            merged << right.shift
        end
    end

    merged + left + right
end

# Clever Octopus O(n)

def clever_octopus(fish)
    longest_found = fish.first

    fish.each { |current_fish| longest_found = current_fish if current_fish.length > longest_found.length }

    longest_found
end

p sluggish_octopus(fish)
p dominant_octopus(fish)
p clever_octopus(fish)