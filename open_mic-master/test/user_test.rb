require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def setup
    @sal = User.new("Sal")
    @megan = User.new("Megan")

    @joke_1 = Joke.new({
      id: 1,
      question: "Why did the strawberry cross the road?",
      answer: "Because his mother was in a jam."
    })

    @joke_2 = Joke.new({
      id: 2,
      question: "How do you keep a lion from charging?",
      answer: "Take away its credit cards."
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
    assert_equal 1, @sal.jokes.count
  end

  def test_it_can_tell_jokes_to_another_user_and_add_to_their_jokes
    assert_empty @megan.jokes

    @sal.tell(@megan, @joke_1)

    assert_equal [@joke_1], @megan.jokes
    assert_equal 1, @megan.jokes.count
  end

  def test_it_can_perform_routine_and_add_several_jokes_to_other_user
    @sal.learn(@joke_1)
    @sal.learn(@joke_2)

    assert_empty @megan.jokes

    @sal.perform_routine_for(@megan)

    assert_equal [@joke_1, @joke_2], @megan.jokes
    assert_equal 2, @megan.jokes.count
  end

  def test_it_can_learn_a_routine
    assert_empty @sal.jokes

    @sal.learn_routine('./jokes.csv')

    assert_equal 100, @sal.jokes.count
  end
end
