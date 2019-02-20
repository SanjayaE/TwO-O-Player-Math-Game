class Turn
  attr_reader :current_player, :second_player, :round

  def initialize current_player, second_player, round
    @current_player = current_player
    @second_player = second_player
    @round = round
  end
end


