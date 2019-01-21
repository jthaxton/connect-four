class Player 
        attr_reader :name 
    def initialize(name)
        @name = name 
    end 

    def get_move
        puts "#{name}, select a column!"
        move = gets.chomp
    end 
end 