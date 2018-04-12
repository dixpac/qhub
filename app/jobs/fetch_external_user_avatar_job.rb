require "open-uri"

class FetchExternalUserAvatarJob < ApplicationJob
  queue_as :default

  def perform(user, avatar_url)
    return true if avatar_url.empty?
    user.avatar.attach(io: open(avatar_url), filename: "#{user.id}-avatar")
  end
end
