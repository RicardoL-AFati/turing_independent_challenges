require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_a_first_name
    assert_equal "Charlotte", @charlotte_bronte.first_name
  end

  def test_it_has_a_last_name
    assert_equal "Bronte", @charlotte_bronte.last_name
  end

  def test_it_has_no_books_when_created
    assert_empty @charlotte_bronte.books
  end
end
