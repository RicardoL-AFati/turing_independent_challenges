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

  def all_players(active_only = false)
    grouped_by_position = group_players_by_position
  end

  def group_players_by_position
    all_players = @teams.reduce([]) do |players, team|
      players.concat(team.players)
    end

    all_players.group_by do

  end

  def get_all_players

  end

end
