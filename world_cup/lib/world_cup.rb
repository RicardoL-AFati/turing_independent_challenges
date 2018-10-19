class WorldCup
  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.reduce([]) do |active_players, team|
      active_players.concat(team.players_by_position(position)) if not team.eliminated
      active_players
    end
  end
end
