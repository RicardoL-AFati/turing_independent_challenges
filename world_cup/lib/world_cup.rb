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

    grouped_by_position.sort.reduce("") do |list, (position, players)|
      list += "#{position.to_s.capitalize}\n"
      sorted_players = players.sort_by {|player| player.name}
      sorted_players.each_with_index.reduce do
    end
  end

  def group_players_by_position(active_only = false)
    get_all_players(active_only).group_by do |player|
      player.position
    end
  end

  def get_all_players(active_only = false)
    @teams.reduce([]) do |players, team|
      players.concat(team.players)
    end
  end

end
