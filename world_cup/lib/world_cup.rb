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
    grouped_by_position = group_players_by_position(active_only).sort

    grouped_by_position.reduce("") do |list, (position, players)|
      list += "#{position.to_s.capitalize}s"
      list += get_player_list(sort_by_name(players))
      list = list.chomp.chomp if grouped_by_position.last[0] == position
      list
    end
  end

  def group_players_by_position(active_only = false)
    get_all_players(active_only).group_by do |player|
      player.position
    end
  end

  def get_all_players(active_only = false)
    @teams.reduce([]) do |players, team|
      if active_only
        players.concat(team.players) if not team.eliminated
      else
        players.concat(team.players)
      end
      players
    end
  end

  def sort_by_name(players)
    players.sort_by {|player| player.name}
  end

  def get_player_list(players)
    players.reduce("") do |player_list, player|
      player_list += "\n\t- #{player.name}"
      player_list += "\n\n" if player == players.last
      player_list
    end
  end
end
