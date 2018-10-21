class Libary
  attr_reader :books
  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.find {|book| book.title == title}
  end

  def card_catalogue
    @books.sort_by {|book| book.author_last_name}
  end

  def find_by_author(author_full_name)
    first, last = author_full_name.split(" ")
    found_books = @books.find_all do |book|
      book.author_first_name == first && book.author_last_name == last
    end
    found_books ? get_title_and_book_hash(found_books) : false
  end

  def find_by_publication_date(date)
    found_books = @books.find_all do |book|
      book.publication_date.include?(date)
    end
    found_books ? get_title_and_book_hash(found_books) : false
  end

  def get_title_and_book_hash(found_books)
    found_books.reduce({}) do |hash, book|
      hash[book.title] = book
      hash
    end
  end
end
