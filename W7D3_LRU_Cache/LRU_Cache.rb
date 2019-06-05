class LRUCache
    
    attr_accessor :cache
    attr_accessor :size
    def initialize(n)
        @size = n
        @cache = []
    end


    def count
        @cache.count
    end

    def add(ele)
        if @cache.include?(ele)
            @cache.delete(ele)
            @cache << ele
        elsif count >= @size
            @cache.shift
            @cache << ele
        else
            @cache << ele
        end
    end

    
    def show
        p @cache
    end



end