class Public::UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    posted_book_ids = @user.posts.pluck(:book_id) #pluckの引数にbook_idを指定し、id情報のみを取得する
    @books = Book.where(id: posted_book_ids).includes(:posts) #whereで７行目で取得したidで絞り込みをする。合わせてBookに紐づくPostを取得する
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to public_user_path(@user.id)
    else
      render :edit
    end
  end

  def withdraw
    current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end




  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end
end
