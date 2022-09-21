class Player

    def get_move
        print 'enter a position with coordinates separated with a space like `4 7`'
        position = gets.chomp
        position_strs = position.split(" ")
        position_arr = position_strs.map {|str| str.to_i}
    end
end
