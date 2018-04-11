class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :omniauthable

  has_many :oauth2_user_infos, dependent: :destroy
  has_many :questions, foreign_key: "creator_id"
  has_many :answers, foreign_key: "creator_id"

  has_one_attached :avatar

  validates :name, presence: true


  def self.create_from_omniauth!(attributes:)
    user = User.create!(email: attributes.info.email, name: attributes.info.name,
      password: Devise.friendly_token[0,20])

    self.download_avatar_for user: user, attributes: attributes

    user
  end

  # In order to avoid introducing BackgrundJob librares, this logic lives here.
  def self.download_avatar_for(user:, attributes:)
    return if attributes.info.image.empty?

    require "open-uri"
    user.avatar.attach(io: open(attributes.info.image), filename: "#{user.id}-avatar")
  end
end
