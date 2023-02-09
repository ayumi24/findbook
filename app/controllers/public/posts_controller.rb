class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @books = RakutenWebService::Books::Book.search(isbn: params[:isbn])
    #render json: { status: 'success', data: @book }
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to public_posts_path
  end

  def index
    @posts = current_customer.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:comment, :readingtime)
  end

end
