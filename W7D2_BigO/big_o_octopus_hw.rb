arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def n_squared(arr)
    longest = 0
    arr.each_with_index do |ele, i|
        longest = ele
        arr.each_with_index do |ele2, i2|
            if i2 > i
                if ele2.length > ele.length
                    longest = ele2
                end
            end
        end
    end
    longest
end

# p n_squared(arr)

class Array

    def merge_sort
        return self if self.length <= 1

        mid = self.length / 2 

        left = self[0...mid]
        right = self[mid..-1]

        s_left = left.merge_sort
        s_right = right.merge_sort

        merge(s_left, s_right)
    end

    def merge(left, right)
        merged = []

        until left.empty? || right.empty?
            if left.first.length < right.first.length
                merged << left.shift
            else
                merged << right.shift
            end
        end

        return merged + left + right
    end

end

# p arr.merge_sort -- returns the sorted array... need to implement this in a way that returns the last element?

def linear(arr)
    longest = arr.first

    arr.each do |ele|
        if ele.length > longest.length
            longest = ele
        end
    end

    longest
end

# p linear(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, array)
    array.each_with_index do |ele, i|
        return i if ele == dir        
    end
end

# p slow_dance("left-up", tiles_array)
tiles_h = {
up: 0,
rightup: 1,
right: 2,
rightdown: 3,
down: 4,
leftdown: 5,
left: 6,
leftup: 7,
}

def f_dance(dir, hash)
    hash[dir]
end

p f_dance(:down, tiles_h)