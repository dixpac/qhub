module AuthorizationHelper
  def can_manage?(record)
    Guardian.new(Current.user, record).can_manage?
  end
end
