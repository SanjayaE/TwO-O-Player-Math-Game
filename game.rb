require_relative './player'
require_relative './turn'

class Game
  def initialize
    @players =[
    Player.new('player1'),
    Player.new('player2')]
    @turn_manager = TurnManager.new(@players)
  end 

  def play

    while(not game_over?) do

      #@turn_manager = turn.next_turn

      # get the next turn from the turn_manager
      turn =@turn_manager.next_turn

      # print out a round header
      puts ""
      puts "==== ROUND ##{turn.round} ====="
      puts ""

      # if the attacking target is dead, print a message and move on
      if turn.player1.dead?
        puts "#{turn.player1.name} is dead ☠️"
        next
      end

      # making wrong answer cost lives
      puts "#{turn.player1.name} is answering Question"
      minus_points = turn.player1.attack 

      # Print the round summary
      print_summary
      # Wait 0.5 seconds so we can actually watch the game go
      sleep 0.5

      # The game is over, print the end game summary
      end_game_summary
    end

    def math_question
      ran_numb1 =  rand(1...20)
      puts ran_numb1
      ran_numb2 =  rand(1...20)
      puts ran_numb2
      puts "what does #{ran_numb1} plus #{ran_numb2} equal?"
    sum= ran_numb1+ran_numb2
      return sum
    end

    def is_answer_correct?
      answer = gets.chomp.to_i
      correct_answer = math_question
      return answer == correct_answer
    end
  end

  def live_or_die
    if is_answer_correct
      @turn.player2
    else
      @minus_points
      turn.player2
    end

    # Helper method to tell when the game is over
    def game_over?
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

  def next_turn
    @current_index = 0
    player1 = @players[@current_index]
    player2 = @players.select {|p| p != player1}.sample
    @current_index = (@current_index + 1) % @players.count
  end

end