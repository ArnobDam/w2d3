class Board
    require "byebug"

    #PART 1

    attr_reader :size

    def initialize(n)
        
        @grid = Array.new(n) {Array.new(n, :N)}
        # (0...n).each do |i|
        #     @grid[i].each {|j| @grid[i][j] = :N}
        # end
        #debugger
        @size = n * n
    end

    def [](pos_indeces)
        @grid[pos_indeces[0]][pos_indeces[1]]
        #debugger
    end

    def []=(pos_indeces, value)
        @grid[pos_indeces[0]][pos_indeces[1]] = value
    end

    def num_ships
        count = 0
        @grid.flatten.each {|ele| count += 1 if ele == :S}
        count
    end
    
    #PART 2

    def attack(pos_indeces)
        if self[pos_indeces] == :S
            self[pos_indeces] = :H
            p 'you sunk my battleship!'
            true
        else
            self[pos_indeces]= :X
            false
        end
    end

    # def place_random_ships
    #     (0..@size/4).each do |loc|
    #         while @grid.flatten()
    #     end
    # end
end
