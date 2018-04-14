class Answer < ApplicationRecord
  include Chronology

  belongs_to :question, counter_cache: true
  belongs_to :creator, class_name: "User", default: -> { Current.user }
  has_many :likes

  validates :content, presence: true

  searchkick word_middle: [:content]

  def gets_liked_by(user:)
    likes.where(creator: user).first_or_create
  end

  def gets_unliked_by(user:)
    likes.where(creator: user).first_or_create
  end
end
