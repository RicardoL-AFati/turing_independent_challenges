require './lib/pantry'
require './lib/recipe'
require 'o_stream_catcher'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new

    @r0 = Recipe.new("Cheese Pizza")
    @r0.add_ingredient("Cheese", 20)
    @r0.add_ingredient("Flour", 20)

    @r1 = Recipe.new("Spaghetti")
    @r1.add_ingredient("Spaghetti Noodles", 10)
    @r1.add_ingredient("Marinara Sauce", 10)
    @r1.add_ingredient("Cheese", 5)

    @r2 = Recipe.new("Pickles")
    @r2.add_ingredient("Brine", 10)
    @r2.add_ingredient("Cucumbers", 30)

    @r3 = Recipe.new("Peanuts")
    @r3.add_ingredient("Raw nuts", 10)
    @r3.add_ingredient("Salt", 10)
  end

  def test_it_has_empty_stock_to_start
    assert_equal ({}), @pantry.stock
  end

  def test_it_returns_0_if_stock_does_have_item
    assert_equal 0, @pantry.stock_check("Cheese")
  end

  def test_it_can_update_stock_of_passed_in_item_with_amount
    assert_equal 0, @pantry.stock_check("Cheese")

    @pantry.restock("Cheese", 10)

    assert_equal 10, @pantry.stock_check("Cheese")
  end

  def test_it_can_check_stock_for_an_item_after_stocking
    @pantry.restock("Cheese", 10)
    @pantry.restock("Cheese", 20)

    assert_equal 30, @pantry.stock_check("Cheese")
  end

  def test_it_can_have_recipe_ingredients_added_to_shopping_list
    assert_equal ({}), @pantry.shopping_list

    @pantry.add_to_shopping_list(@r0)

    expected = {"Cheese" => 20, "Flour" => 20}

    assert_equal expected, @pantry.shopping_list
  end

  def test_it_can_have_multiple_recipes_added_to_list
    assert_equal ({}), @pantry.shopping_list

    @pantry.add_to_shopping_list(@r0)
    @pantry.add_to_shopping_list(@r1)

    expected = {"Cheese" => 25, "Flour" => 20, "Spaghetti Noodles" => 10, "Marinara Sauce" => 10}

    assert_equal expected, @pantry.shopping_list
  end

  def test_it_can_print_shopping_list_and_return
    @pantry.add_to_shopping_list(@r0)
    @pantry.add_to_shopping_list(@r1)

    result, stdout = OStreamCatcher.catch do
      @pantry.print_shopping_list
    end

    expected = "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10"

    assert_equal expected, result
    assert_equal "#{expected}\n", stdout
  end

  def test_it_starts_with_empty_cookbook
    assert_equal ({}), @pantry.cookbook
  end

  def test_it_can_add_to_cook_book
    assert_equal ({}), @pantry.cookbook

    @pantry.add_to_cookbook(@r0)
    @pantry.add_to_cookbook(@r2)
    @pantry.add_to_cookbook(@r3)

    expected = {
      :"Cheese Pizza" => {:Cheese => 20, :Flour => 20},
      :Pickles => {:Brine => 10, :Cucumbers => 30},
      :Peanuts => {:"Raw nuts" => 10, :Salt => 10}
    }

    assert_equal expected, @pantry.cookbook
  end

  def test_it_can_return_recipes_it_can_make_based_on_stock
    @pantry.add_to_cookbook(@r0)
    @pantry.add_to_cookbook(@r2)
    @pantry.add_to_cookbook(@r3)

    @pantry.restock("Cheese", 10)
    @pantry.restock("Flour", 20)
    @pantry.restock("Brine", 40)
    @pantry.restock("Cucumbers", 120)
    @pantry.restock("Raw nuts", 20)
    @pantry.restock("Salt", 20)

    assert_equal ["Pickles", "Peanuts"], @pantry.what_can_i_make
  end
end
