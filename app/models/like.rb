class Like < ApplicationRecord
  belongs_to :liker, class_name: "User", default: -> { Current.user }
  belongs_to :likeable, polymorphic: true

  scope :with_liker, ->(liker) { where liker: liker }
  scope :with_likeable, ->(likeable) { where likeable: likeable }

  def self.like(liker:, likeable:)
    find_or_create_by liker: liker, likeable: likeable
  end

  def self.liking?(liker:, likeable:)
    return false if liker.nil? || likeable.nil?

    with_liker(liker).with_likeable(likeable).count > 0
  end

  def self.unlike(liker:, likeable:)
    with_liker(liker).with_likeable(likeable).each(&:destroy)
  end
end
