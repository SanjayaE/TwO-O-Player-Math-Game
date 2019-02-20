require_relative './turn'

    class TurnManager
        def initialize players
            @players = players.dup
            @round = 0
            @current_player = @players[0]
            @second_player = @players[1]
        
        end

        def next_turn
          
           new_turn
            turn = Turn.new(@current_player,@second_player,@round)
            
            #  print out a round header
             puts ""
             puts "==== New Turn #{turn.round} ====="
             puts ""
             ran_numb1 =  rand(1...20)
      
            ran_numb2 =  rand(1...20)
             sum= ran_numb1+ran_numb2
           puts "#{turn.current_player.name}: What does #{ran_numb1} plus #{ran_numb2} equal "
            answer = gets.chomp.to_i
                if sum != answer
                    puts "#{turn.current_player.name}: Seriously? No"
                    turn.current_player.minus_points
                else 
                    puts "#{turn.current_player.name}: YES!, you are correct"
                end

        end
          
        private

        def new_turn
            @round += 1
            @current_index = 0
            temp =  @second_player
            @second_player = @current_player
             @current_player = temp
        end
end