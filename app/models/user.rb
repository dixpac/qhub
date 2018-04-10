class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, foreign_key: "creator_id"
  has_many :answers, foreign_key: "creator_id"

  validates :name, presence: true
end
