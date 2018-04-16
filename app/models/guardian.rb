# Super Simple authorization logic.
class Guardian
  class NotAuthorizedError < StandardError; end

  attr_accessor :user, :object

  def initialize(user, object)
    @user = user
    @object = object
  end

  def can_manage?
    user.id == object.creator_id
  end
end
