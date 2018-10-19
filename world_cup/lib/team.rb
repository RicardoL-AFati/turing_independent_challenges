class Team
  attr_reader :country
  attr_accessor :players, :eliminated
  def initialize(country)
    @country = country
    @players = []
    @eliminated = false
  end

  def eliminated?
    eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    @players.find_all {|player| player.position == position}
  end
end
