module Public::UsersHelper
  def posts_user_id posts, user_id
    posts.find_by(user_id: user_id)
  end
end
