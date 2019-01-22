require_relative "board"
require_relative "player"
class Game 
    attr_accessor :board, :players, :infinity

    def initialize(height, width, infinity=false, *players)
        @board = Board.new(height, width, infinity)
        @players = *players
    end 


    def game_over?
        # change to while loop or index
        @board.grid.each_with_index do |col, idx|
            unless @board.invalid_move?(idx)
                return false 
            end 
        end 
        return true 
    end
end 