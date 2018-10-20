require './lib/team'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class TeamTest < Minitest::Test
  def setup
    @france = Team.new("France")
    @mbappe = Player.new("Kylian Mbappe", :forward)
    @griezmann = Player.new("Antoine Griezmann", :forward)
    @pogba = Player.new("Paul Pogba", :midfielder)
  end

  def test_it_has_no_players_when_created
    assert_empty @france.players
  end

  def test_is_not_eliminated_when_created
    refute @france.eliminated?
  end

  def test_it_has_a_country
    assert_equal "France", @france.country
  end

  def test_it_can_add_players_to_team
    assert_empty @france.players

    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    assert_equal [@mbappe, @griezmann, @pogba],
    @france.players
  end

  def test_it_can_retrieve_players_by_position_single
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    assert_equal [@pogba],
    @france.players_by_position(:midfielder)
  end

  def test_it_can_retrieve_players_by_position_multiple
    @france.add_player(@mbappe)
    @france.add_player(@griezmann)
    @france.add_player(@pogba)

    assert_equal [@mbappe, @griezmann],
    @france.players_by_position(:forward)
  end
end
