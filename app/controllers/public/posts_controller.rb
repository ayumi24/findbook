class Public::PostsController < ApplicationController
  before_action :correct_user, only: %i(show edit update destroy)
  def new
    @book = Book.find_or_initialize_by(isbn: params[:book][:isbn])
    @book.assign_attributes(book_params) if @book.new_record?
    @book.posts.build
  end

  def create
    @book = Book.find_or_initialize_by(isbn: params[:book][:isbn])
    if @book.new_record?
      @book.assign_attributes(book_params)
      @book.save!
    end
    @post = @book.posts.build(post_params)
    if @post.save
      redirect_to public_book_path(@book)
    else
      render :new
    end
  end

  def index
    @books = Book.includes(:posts)
    @posts = current_user.posts
  end

  def show
    @book = Book.includes(:posts).find(params[:id])
    @posts = @book.posts
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
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
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :comment, :readingtime)
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :item_url, :book_image_url)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url unless @post
  end
end
