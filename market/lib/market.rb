class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten.uniq.sort
  end

  def total_inventory
    vendors.reduce(Hash.new(0)) do |total_i, vendor|
      vendor.inventory.each do |item, amount|
        total_i[item] += amount
      end
      total_i
    end
  end

  def sell(item, quantity)
    return false unless total_inventory[item] > quantity

    update_vendors(item, quantity)
  end

  def update_vendors(item, quantity)
    vendors.reduce(quantity) do |to_sell, vendor|
      next to_sell unless vendor.inventory.include?(item)
      if vendor.inventory[item] >= to_sell
        vendor.sell(item, to_sell)
        return true
      else
        to_sell -= vendor.inventory[item]
        vendor.sell(item)
      end
      to_sell
    end
  end
end
