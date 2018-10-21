class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(user, joke)
    user.learn(joke)
  end

  def perform_routine_for(user)
    @jokes.each {|joke| user.learn(joke)}
  end

  def learn_routine(routine)
    require 'pry'; binding.pry
  end
end
