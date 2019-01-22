require 'captains_mistress'
require_relative "game"
require 'byebug'
require 'pp'

module CaptainsMistress
  # The application object. Create it with options for the game, then run by
  # calling #run.
  class App
    attr_reader :verbose, :length

    def initialize(options)
      @verbose = options.fetch(:verbose, false)
      @width = options[:width].to_i
      @height = options[:height].to_i
      @players = options[:players].to_i
      @infinity = true if options[:infinity] == true
      
    end

    def run
      # You should implement this method.
      nums = ['0', '1', '2', '3', '4', '5', '6']
      puts "Welcome to Captain's Mistress!"
      player_names = []
      until player_names.length == @players 
        puts "Insert name:"
        name = STDIN.gets.chomp
        player_names << name 
      end 
      game = Game.new(@height, @width, @infinity, player_names)
      players = game.players.flatten
      until game.game_over? || game.board.game == false
        current_player = players[0]
        puts " "
        puts "#{current_player} choose a column from 0 - #{@width}:"
        current_col = STDIN.gets.chomp
        if game.board.invalid_move?(current_col) || !nums.include?(current_col)
          puts 'Invalid move. Try again.'
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
