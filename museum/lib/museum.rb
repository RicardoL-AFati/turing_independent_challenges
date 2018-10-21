class Museum
  attr_reader :name, :exhibits, :revenue
  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
  end

  def add_exhibit(name, cost)
    @exhibits[name.to_sym] = {cost: cost, patrons: []}
  end

  def admit(patron)
    @revenue += 20
    update_exhibits_with(patron)
  end

  def update_exhibits_with(patron)
    patron.interests.each do |interest|
      if @exhibits.key?(interest.to_sym)
        @exhibits[interest.to_sym][:patrons] << patron.name
      end
    end
  end
end
