class Public::BooksController < ApplicationController
  #書籍の情報は外部APIを使用して情報を取得している為コントローラは必要でもモデルは無くても良い
  #isbnコードがあればその他の情報も取得できる為コードの簡略化ができそうである
  def show
    @book = Book.find(params[:id])
    @posts = Post.all
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

private

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
