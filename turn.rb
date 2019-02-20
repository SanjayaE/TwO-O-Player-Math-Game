class Turn
  attr_reader :player1, :player2, :round

  def initialize player1, player2, round
    @player1 = player1
    @player2 = player2
    @round = round
  end
end