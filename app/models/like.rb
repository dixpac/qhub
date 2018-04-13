class Like < ApplicationRecord
  belongs_to :answer
  belongs_to :creator, class_name: "User", default: -> { Current.user }
end
