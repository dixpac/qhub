class Like < ApplicationRecord
  belongs_to :answer, counter_cache: true
  belongs_to :creator, class_name: "User", default: -> { Current.user }
end
