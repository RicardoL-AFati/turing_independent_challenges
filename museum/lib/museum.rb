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

  def patrons_of(exhibit_name)
    @exhibits[exhibit_name.to_sym][:patrons].uniq
  end

  def exhibits_by_attendees
    sorted_exhibit_array = sort_by_attendees_most_to_least
    get_hash_from_exhibit_array(sorted_exhibit_array)
  end

  def sort_by_attendees_most_to_least
    @exhibits.sort do |(a, attributes_a), (b, attributes_b)|
      attributes_b[:patrons].count <=> attributes_a[:patrons].count
    end
  end

  def get_hash_from_exhibit_array(array)
    array.reduce({}) do |hash, exhibit_sub_array|
      hash[exhibit_sub_array[0]] = exhibit_sub_array[1]
      hash
    end
  end
end
