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
end
