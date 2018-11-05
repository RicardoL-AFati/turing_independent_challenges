require 'pry'

class Pantry
  attr_reader :stock, :shopping_list, :cookbook
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = Hash.new(0)
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

  def add_to_cookbook(recipe)
    @cookbook[recipe.name.to_sym] = keys_to_sym(recipe.ingredients)
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

  def what_can_i_make
    cookbook.reduce([]) do |can_make, (recipe, ingredients)|
      can_make << recipe.to_s if enough_in_stock?(ingredients)
      can_make
    end
  end

  def enough_in_stock?(ingredients)
    ingredients.all? do |ingredient, amount|
      stock[ingredient] >= amount
    end
  end

  def keys_to_sym(hash)
    hash.reduce({}) do |new_h, (k,v)|
      new_h[k.to_sym] = v
      new_h
    end
  end
end
