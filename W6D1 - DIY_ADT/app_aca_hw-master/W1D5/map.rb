class Map

    attr_reader :map, :key

    def initialize
        @map = [[]]
    end

    def set(key, value)
        @key = key
        @map.each do |subarr|
            if !subarr.include?(key)
                subarr << key
                subarr << value
            else 
                subarr.pop
                subarr << value
            end
        end
    end

    def get(key)
         @map.each do |ele|
            if ele.include?(key)
                return ele
            end
        end
    end

    def delete(key)
      @map.each do |ele|
        if ele.include?(key)
            @map.delete(ele)
        end
    end
            
    end

    def show
        @map
    end

end