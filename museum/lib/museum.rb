class Museum
  attr_reader :name
  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
  end

  def add_exhibit(name, cost)
    @exhibits[name.to_sym] = {cost: cost, attendees: 0}
  end
end
