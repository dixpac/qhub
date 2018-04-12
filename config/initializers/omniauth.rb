Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.test?
end
