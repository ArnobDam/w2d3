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

    def print
        @board.each do |arr|
            print arr.join(" ")
            puts
        end
    end

    def win_row?(mark)
        @board.each do |arr|
            if arr.all? {|ele| ele == mark}
                return true
            end
        end
        false
    end

    def win_col?(mark)
        (0...@board.length).each do |i|
            count = 0
            @board.each do |arr|
                if arr[i] == mark
                    count += 1
                end
            end
            if count == @board.length
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        #diagonal starting at top left corner
        count = 0
        @board.each_with_index do |arr,i1|
            arr.each_with_index do |ele,i2|
                if i1 == i2
                    if ele == mark
                        count += 1
                    end
                end
            end
        end
        if count == 3
            return true
        end
        #false

        #diagonal starting at top right corner
        count = 0
        @board.each_with_index do |arr,i1|
            arr.each_with_index do |ele,i2|
                if i1 == arr.length - 1 - i2
                    if ele == mark
                        count += 1
                    end
                end
            end
        end
        if count == 3
            return true
        end
        false
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        end
        false
    end
end