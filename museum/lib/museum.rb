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
    update_exhibits_based_on_interests(patron)
  end

  def update_exhibits_based_on_interests(patron)
    patron.interests.each do |interest|
      if @exhibits.key?(interest.to_sym)
        @exhibits[interest.to_sym][:attendees] += 1
      end
    end
  end
end
