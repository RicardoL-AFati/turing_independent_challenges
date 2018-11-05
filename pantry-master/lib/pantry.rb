require 'pry'

class Pantry
  attr_reader :stock, :shopping_list
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cook_book = Hash.new(0)
  end

  def stock_check(item)
    stock[item.to_sym]
  end

  def restock(item, amount)
    @stock[item.to_sym] += amount
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |ingredient, amount|
      @shopping_list[ingredient] += amount
    end
  end

  def print_shopping_list
    list = shopping_list.map.with_index do |(ingredient, amount), index|
      list_item = "* #{ingredient}: #{amount}"
      list_item += "\n" unless index == shopping_list.length - 1
      list_item
    end.join
    puts list
    list
  end
end
