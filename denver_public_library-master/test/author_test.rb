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

  def test_it_can_receive_books
    assert_empty @charlotte_bronte.books

    @charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    @charlotte_bronte.add_book("Villette", "1853")

    assert_equal 2, @charlotte_bronte.books.count

    assert_equal "Charlotte", @charlotte_bronte.books[0].author_first_name
    assert_equal "Bronte", @charlotte_bronte.books[0].author_last_name
    assert_equal "Jane Eyre", @charlotte_bronte.books[0].title
    assert_equal "October 16, 1847", @charlotte_bronte.books[0].publication_date

    assert_equal "Charlotte", @charlotte_bronte.books[1].author_first_name
    assert_equal "Bronte", @charlotte_bronte.books[1].author_last_name
    assert_equal "Villette", @charlotte_bronte.books[1].title
    assert_equal "1853", @charlotte_bronte.books[1].publication_date
  end
end
