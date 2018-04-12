class Question < ApplicationRecord
  include Chronology

  belongs_to :creator, class_name: "User", default: -> { Current.user }
  has_many :answers, dependent: :destroy

  validates :title, :content, presence: true

  searchkick word_middle: [:title, :content]
end
