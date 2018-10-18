require './super_fizz_buzz'
require 'minitest/autorun'
require 'minitest/pride'

class SuperFizzBuzzTest < Minitest::Test
  def setup
    @super_fizz_buzz = SuperFizzBuzz.new
  end

  def test_it_returns_just_the_number_if_not_evenly_divisible_by_three_five_or_seven
    assert_equal "8", @super_fizz_buzz.output(8)
  end

  def test_it_returns_super_if_the_number_is_evenly_divisible_by_seven
    assert_equal "Super", @super_fizz_buzz.output(14)
  end

  def test_it_returns_buzz_if_the_number_is_evenly_divisible_by_five
    assert_equal "Buzz", @super_fizz_buzz.output(10)
  end

  def test_it_returns_fizz_if_the_number_is_evenly_divisible_by_three
    assert_equal "Fizz", @super_fizz_buzz.output(9)
  end

  def test_it_returns_fizz_buzz_if_the_number_is_evenly_divisible_by_three_and_five
    assert_equal "FizzBuzz", @super_fizz_buzz.output(15)
  end

  def test_it_returns_super_buzz_if_the_number_is_evenly_divisible_by_five_and_seven
    assert_equal "SuperBuzz", @super_fizz_buzz.output(35)
  end

  def test_it_returns_super_fizz_if_the_number_is_evenly_divisible_by_three_and_seven
    assert_equal "SuperFizz", @super_fizz_buzz.output(21)
  end

  def test_it_returns_super_fizz_buzz_if_the_number_is_evenly_divisible_by_three_five_and_seven
    assert_equal "SuperFizzBuzz", @super_fizz_buzz.output(105)
  end

  def test_it_returns_array_of_words_and_or_numbers_for_a_given_range
    assert_equal ["8", "Fizz", "Buzz", "11", "Fizz", "13", "Super", "FizzBuzz"],
    @super_fizz_buzz.output_range(8, 15)
  end

  def test_it_
end
