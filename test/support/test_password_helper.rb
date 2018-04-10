module TestPasswordHelper
  def default_password_digest
    User.new.send(:password_digest, default_password)
  end

  def default_password
    "password"
  end
end
