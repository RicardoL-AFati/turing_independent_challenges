require './lib/museum'
require './lib/patron'
require 'minitest/autorun'
require 'minitest/pride'

class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")

    @bob = Patron.new("Bob")
    @bob.add_interest("Gems and Minerals")
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Imax")

    @sally = Patron.new("Sally")
    @sally.add_interest("Dead Sea Scrolls")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_a_name
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_it_has_no_exhibits_when_created
    assert_equal ({}), @dmns.exhibits
  end

  def test_it_has_no_revenue_when_created
    assert_equal 0, @dmns.revenue
  end

  def test_it_can_receive_new_exhibits
    expected = {
      "Dead Sea Scrolls": {
        cost: 10,
        attendees: 0
      }
    }

    @dmns.add_exhibit("Dead Sea Scrolls", 10)
    assert_equal expected, @dmns.exhibits
  end

  def test_it_can_admit_patrons_and_update_revenue
    assert_equal 0, @dmns.revenue

    @dmns.admit(@bob)
    @dmns.admit(@sally)

    assert_equal 40, @dmns.revenue
  end

  def test_it_can_admit_patrons_and_update_attendees_for_exhibits
    @dmns.add_exhibit("Dead Sea Scrolls", 10)
    @dmns.add_exhibit("Gems and Minerals", 0)
    @dmns.add_exhibit("Imax", 15)

    assert_equal 0, @dmns.exhibits[:"Dead Sea Scrolls"][:attendees]
    assert_equal 0, @dmns.exhibits[:"Gems and Minerals"][:attendees]
    assert_equal 0, @dmns.exhibits[:Imax][:attendees]

    @dmns.admit(@bob)
    @dmns.admit(@sally)

    assert_equal 2, @dmns.exhibits[:"Dead Sea Scrolls"][:attendees]
    assert_equal 1, @dmns.exhibits[:"Gems and Minerals"][:attendees]
    assert_equal 1, @dmns.exhibits[:Imax][:attendees]
  end
end
