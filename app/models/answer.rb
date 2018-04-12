class Answer < ApplicationRecord
  include Chronology

  belongs_to :question, counter_cache: true
  belongs_to :creator, class_name: "User", default: -> { Current.user }

  validates :content, presence: true

  searchkick word_middle: [:content]
end
