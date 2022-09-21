class Board
    require "byebug"

    #PART 1

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
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

    def place_random_ships
        (0...@size/4).each do |n|
            #debugger
            i1 = rand(0...@grid.length)
            i2 = rand(0...@grid.length)
            while self[[i1,i2]] == :S
                i1 = rand(0...@grid.length)
                i2 = rand(0...@grid.length)
            end
            self[[i1,i2]] = :S
        end
        #debugger
    end

    def hidden_ships_grid
        hidden_grid = Array.new(@grid.length) {Array.new(@grid.length)}
        (0...@grid.length).each do |i1|
            (0...@grid.length).each do |i2|
                if self[[i1,i2]] == :S
                    hidden_grid[i1][i2] = :N
                else
                    hidden_grid[i1][i2] = self[[i1,i2]]
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(grid)
        grid.each do |arr|
            (0...arr.length).each do |i|
                if i < arr.length - 1
                    print arr[i].to_s + " "
                else
                    print arr[i].to_s
                end
            end
            puts
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end

# grid = [[1,2,3],[4,5,6],[7,8,9]]
# grid.each do |arr|
#     arr.each {|ele| print ele.to_s + " "}
#     puts
# end