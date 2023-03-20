class Public::BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @posts = @book.posts
  end

  def search
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
      })
      @books = results.map do |result|
        attributes = read(result)
        book = Book.find_or_initialize_by(isbn: attributes[:isbn])
        book.assign_attributes(attributes) if book.new_record?
        book
      end
    end
  end
  
  def create
    @book = Book.find_or_initialize_by(isbn: params[:book][:isbn])
    if @book.new_record?
      @book.assign_attributes(book_params)
      @book.save!
    end

    redirect_to public_book_path(@book.id)
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :item_url, :book_image_url)
  end
#カラムに対応する値を入れるようにコードを記述する
#設定したカラム名と同じ名前を記述すること
  def read(result)
    title = result["title"]
    author = result["author"]
    item_url = result["itemUrl"]
    isbn = result["isbn"]
    book_image_url = result["mediumImageUrl"].gsub('?_ex=120x120', '')
    {
      title: title,
      author: author,
      item_url: item_url,
      isbn: isbn,
      book_image_url: book_image_url
    }
  end
end

#ページネーションを追加したい
#.page(params[:page])
