class User::BooksController < ApplicationController

  def search
    @books = []
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
      })
      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
    @books.each do |book|
      unless Book.all.include?(book)
        book.save
      end
    end
  end

private

  def read(result)
    title = result["title"]
    author = result["author"]
    book_url = result["bookUrl"]
    isbn = result["isbn"]
    book_image_url = result["mediumImageUrl"].gsub('?_ex=70x70', '')
    {
      title: title,
      author: author,
      book_url: book_url,
      isbn: isbn,
      book_image_url: book_image_url
    }
  end
end
