require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < Minitest::Test
  def setup
    @pogba = Player.new("Paul Pogba", :midfielder)
  end

  def test_it_exists
    assert_instance_of Player, @pogba
  end

  def test_it_has_a_name
    assert_equal "Paul Pogba", @pogba.name
  end

  def test_it_has_a_position
    assert_equal :midfielder, @pogba.position
  end
end
