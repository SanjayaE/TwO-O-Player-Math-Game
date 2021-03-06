require_relative './turn'
require_relative './player'

class Player
  attr_reader :name, :lives
  MAX_LIVES = 3
  
  def initialize name
    @name = name
    @lives = MAX_LIVES
  end

  def minus_points
    @lives -= 1
  end

  def summary

    "#{name}: #{@lives} / #{MAX_LIVES}"
  end

  def dead_summry
    dead?
  end

  def dead?
    @lives ==0
  end
end
