module PostsHelper
  def format_created_at created_at
    time_ago_in_words(created_at)
  end

  def find_object_like object
    object.likes.find_by(likeable: object, user: current_user)
  end

end
