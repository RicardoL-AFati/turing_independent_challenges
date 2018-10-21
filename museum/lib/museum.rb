class Museum
  attr_reader :name, :exhibits, :revenue
  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
  end

  def add_exhibit(name, cost)
    @exhibits[name.to_sym] = {cost: cost, attendees: 0}
  end

  def admit(patron)
    @revenue += 20

    patrons.interests.each do |interest|
      exhibits[interest.to_sym][:attendees] += 1
    end
  end
end
