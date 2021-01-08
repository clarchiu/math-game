class Player
  attr_reader :lives

  def initialize
    @lives = 3
  end 

  def lose_life
    @lives -= 1
  end

  def dead?
    @lives <= 0
  end
end