require_relative "board"
require_relative "player"
class Game 
    attr_accessor :player1, :player2, :board

    def initialize(name1, name2)
        @player1 = Player.new(name1.to_sym)
        @player2 = Player.new(name2.to_sym)
        @board = Board.new
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