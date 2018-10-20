require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def setup
    @sal = User.new("Sal")

    @joke_1 = Joke.new({
      id: 1,
      question: "Why did the strawberry cross the road?",
      answer: "Because his mother was in a jam."
    })
  end

  def test_it_exists
    assert_instance_of User, @sal
  end

  def test_it_has_a_name
    assert_equal "Sal", @sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_it_has_no_jokes_to_start
    assert_empty @sal.jokes
  end

  def test_it_can_learn_a_joke
    assert_empty @sal.jokes

    @sal.learn(@joke_1)
    assert_equal [@joke_1], @sal.jokes
  end
end
