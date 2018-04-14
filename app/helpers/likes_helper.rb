module LikesHelper
  def like_path_for(likeable)
    likes_path sgid: likeable.to_sgid.to_s
  end
end
