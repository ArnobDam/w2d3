class Board

    def initialize
        @board = Array.new(3) {Array.new(3,'_')}
    end

    def valid?(position)
        if position[0] < 0 || position[1] < 0
            return false
        end

        if position[0] < @board.length && position[1] < @board.length
            true
        else
            false
        end
    end

    def empty?(position)
        if @board[position[0]][position[1]] == '_'
            true
        else
            false
        end
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @board[position[0]][position[1]] = mark
        else
            raise "invalid move"
        end
    end

    def print?
        @board.each do |arr|
            print arr.join(" ")
            puts
        end
    end
end