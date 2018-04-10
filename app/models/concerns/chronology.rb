module Chronology
  extend ActiveSupport::Concern

  included do
    scope :chronologically, -> { order 'created_at asc, id desc' }
    scope :reverse_chronologically, -> { order 'created_at desc, id desc' }
  end
end
