require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test
  def setup
    @joke_1 = Joke.new({
      id: 1,
      question: "Why did the strawberry cross the road?",
      answer: "Because his mother was in a jam."
    })
  end

  def test_it_exists
    assert_instance_of Joke, @joke_1
  end

  def test_it_has_an_id
    assert_equal 1, @joke_1.id
  end

  def test_it_has_a_question
    assert_equal "Why did the strawberry cross the road?",
    @joke_1.question
  end

  def test_it_has_an_answer
    assert_equal "Because his mother was in a jam.",
    @joke_1.answer
  end
end
