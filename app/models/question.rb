class Question < ApplicationRecord
  include Chronology

  belongs_to :creator, class_name: "User", default: -> { Current.user }
  has_many :answers

  validates :title, :content, presence: true
end
