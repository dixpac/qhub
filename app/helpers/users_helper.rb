module UsersHelper
  # Helper which decides weather do display user avatar or
  # generic placeholder avatar image
  def user_avatar(user, options = {})
    options[:size] ||= "32x32"
    options[:class] ||= ""
    options[:class] << " rounded-circle"

    image_tag user_avatar_url(user, options[:size]), class: options[:class],
      size: options[:size], title: user.name, data: { :avatar_for_user_id => user.id }
  end

  def user_avatar_url(user, size)
    if user.avatar.attached?
      url_for(user.avatar.representation(resize: size))
    else
      asset_path "user.png"
    end
  end
end
