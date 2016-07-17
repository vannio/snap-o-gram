module LikesHelper
  def find_like(picture, user)
    picture.likes.find_by(user_id: user.id)
  end
end
