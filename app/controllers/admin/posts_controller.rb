class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to admin_posts_path
  end
end
