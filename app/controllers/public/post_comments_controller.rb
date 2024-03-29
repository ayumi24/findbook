class Public::PostCommentsController < ApplicationController
  def new
  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
     if comment.save
       redirect_to public_post_path(post.id)
     else
       flash[:notice] = "コメントを入力して送信してください"
       redirect_to public_post_path(post.id)
     end
  end



  def destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
