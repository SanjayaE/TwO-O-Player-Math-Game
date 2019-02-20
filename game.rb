require_relative './player'
require_relative './turn'
require_relative './turn_manager'

class Game
  def initialize
    @players =[
    Player.new('Larry David'),
    Player.new('Christian Bale')]
    @turn_manager = TurnManager.new(@players)
  end 

    def play 
       print_summary
        while(! game_over) do
            @turn_manager.next_turn
            print_summary
        end
      end_game_summary
      end

    # Helper method to tell when the game is over
    def game_over
      alive_players.count == 1
    end

    # Helper method to get all the alive robots
    def alive_players
      @players.select {|r| not r.dead? }
    end

    def print_summary
      puts ""
      puts "===== SUMMARY ====="
        @players.each do |r|
          puts r.summary
        end
      puts ""
    end

    def end_game_summary
      winner = alive_players[0]
      puts ""
      puts "GAME OVER!"
      puts "#{winner.name} Wins!"
      puts "Congratulations"
    end
  end

