require './lib/patron'
require 'minitest/autorun'
require 'minitest/pride'

class PatronTest < Minitest::Test
  def setup
    @patron = Patron.new("Bob")
  end

  def test_it_exists
    assert_instance_of Patron, @patron
  end

  def test_it_has_a_name
    assert_equal "Bob", @patron.name
  end

  def test_it_has_no_interests_when_created
    assert_empty @patron.interests
  end
end
