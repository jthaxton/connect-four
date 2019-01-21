require 'pp'
class Board 
    attr_accessor :grid, :game
    # initialize empty 6 row 7 col grid
    def initialize
        @grid = Array.new(6) {Array.new(7) {nil} } 
        @game = true 
    end 

    # place piece into grid if column not full
    def place(col, player)
        # raise "Error: Column is full" if invalid_move?(col)
        col = col.to_i
        i = 0 
        while i < 6 
            if !invalid_move?(col) && @grid[i][col].nil? && i == 5
                @grid[i][col] = player 
                if win?(i, col, player)
                    puts "#{player} wins! Game over!"
                    @game = false 
                end
            elsif !invalid_move?(col) && @grid[i][col].nil? && @grid[i + 1][col]
                @grid[i][col] = player 
                if win?(i, col, player)
                    puts "#{player} wins! Game over!"
                    @game = false 
                end
            end 
            i += 1 
        end 
        pp @grid
    end 

    # check if column is full 
    def invalid_move?(col)
        col = col.to_i
        i = 0 
        # return true unless range.include?(col)
        while i < 6  && col < 7
            if @grid[i][col] == nil
                return false 
            end 
            i += 1 
        end 
        return true 
    end 

    def diagonal_win?(row, col, player)
        # diagonal right, up, down
        i = 0 
        while i <= 3 
            unless (col + i < 7) && 
                (row + i < 6) && 
                (col - i >= 0) && 
                (row - i >= 0) &&
                @grid[row + i][col + i] == player || 
                @grid[row - i][col - i] == player
                return false 
            end 
            i += 1 
        end 
        
        # diagonal left, up, down
        i = 0
        while i <= 3 
            unless (col + i < 7) && 
                (row + i < 6) && 
                (col - i >= 0) && 
                (row - i >= 0) &&
                @grid[row - i][col + i] == player ||
                @grid[row + i][col - i] == player 
                return false 
            end 
            i += 1 
        end 
        true 
    end 

    def horizontal_win?(row, col, player)
            if subsets_match?(@grid[row], player)
                return true 
            end  
        false 
    end 

    def vertical_win?(row, col, player)
        i = 0 
        while i <= 3
            unless (row + i < 6) &&
                (@grid[row + i][col] == player ||
                @grid[row - i][col] == player )
                return false 
            end 
            i += 1 
        end 
        true 
    end 

    def win?(row, col, player)
        if vertical_win?(row,col,player) ||
            horizontal_win?(row,col,player) ||
            diagonal_win?(row,col,player)
            @game = false 
            return true 
        end 
            p diagonal_win?(row,col,player)
            p horizontal_win?(row,col,player)
            p vertical_win?(row, col, player)
        false 
    end 

    def show
        @grid
    end 

    def subsets_match?(arr, player)
        i = 0 
        while i < arr.length - 3
            if arr[i..i + 3] == [player,player,player,player]
                return true 
            end 
            i += 1 
        end 
        false 
    end 

end 

