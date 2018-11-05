class Pantry
  attr_reader :stock, :shopping_list
  def initialize
    @stock = Hash.new(0)
    @shopping_list = {}
  end

  def stock_check(item)
    stock[item.to_sym]
  end

  def restock(item, amount)
    @stock[item.to_sym] += amount
  end
end
