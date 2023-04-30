class Public::PostsController < ApplicationController
  #ログインしているユーザーのみ利用可能
  before_action :authenticate_user!
  before_action :correct_user, only: %i(edit, update, destroy)
  
  def new
    @book = Book.find_or_initialize_by(isbn: params[:isbn])
    if @book.new_record?
      results = RakutenWebService::Books::Book.search(isbn: params[:isbn])
      rakuten_book = results.first
      if rakuten_book.present?
        @book.assign_attributes(
          title: rakuten_book.title,
          author: rakuten_book.author,
          item_url: rakuten_book.item_url,
          book_image_url: rakuten_book.medium_image_url.gsub('?_ex=120x120', '')
        )
        @book.save!
      end
    else
      post = @book.posts.find_by(user_id: current_user.id)
      if post.present?
        redirect_to public_post_path(post), notice: "既にレビューした書籍です"
      end
    end

    @tags = Tag.all
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to public_book_path(post_params[:book_id])
    else
      @book = Book.find(post_params[:book_id])
      @tags = Tag.all
      render :new
    end
  end

  def search
    @posts = Post.all
      if params[:tag_ids]
        @posts = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_posts = Tag.find_by(tagname: key).posts
            @posts = @posts.empty? ? tag_posts : @posts & tag_posts
          end
        end
      end
    @books = Book.includes(:posts)
  end

  def index
    @posts = Post.all
      if params[:tag_ids]
        @posts = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_posts = Tag.find_by(tagname: key).posts
            @posts = @posts.empty? ? tag_posts : @posts & tag_posts
          end
        end
      end
    @books = Book.includes(:posts)
    #@posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
    @tag = Tag.find_by(id: @post.tag_id)
    @post_comment = PostComment.new
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
    @tags = Tag.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post.id)
    else
      @new_post = Post.new
      render :edit
    end
  end

  def destroy
    @user = current_user
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_user_path(@user.id)
  end

  private

  def post_params
    params.require(:post).permit(:book_id, :comment, :readingtime, :tag_id)
  end

  def correct_user
     @post = current_user.posts.find_by(id: params[:id])
    unless @post.user.id == current_user.id
     redirect_to root_url unless @post
    end
  end
end
