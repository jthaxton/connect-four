require 'captains_mistress'
require_relative "game"
require 'byebug'
require 'pp'

module CaptainsMistress
  # The application object. Create it with options for the game, then run by
  # calling #run.
  class App
    attr_reader :verbose

    def initialize(options = {})
      @verbose = options.fetch(:verbose, false)
    end

    def run
      # You should implement this method.
      nums = ['0', '1', '2', '3', '4', '5', '6']
      puts "Welcome to Captain's Mistress!"
      puts "Player1 insert name:"
      player1 = gets.chomp
      puts "Player2 insert name:"
      player2 = gets.chomp
      game = Game.new(player1, player2)
      players = [player1, player2]
      until game.game_over? || game.board.game == false
        current_player = players[0]
        puts " "
        puts "#{current_player} choose a column from 0 - 6:"
        current_col = gets.chomp
        if game.board.invalid_move?(current_col) || !nums.include?(current_col)
          puts 'Invalid move'
          next
        else 
          game.board.place(current_col,current_player)
          break if game.board.game == false 
        end  
        players.rotate!(1) 
      end 
      # raise 'Not implemented'
    end
  end
end
