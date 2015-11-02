OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.configuration.fb_app_id, Rails.configuration.fb_app_secret, {:client_options => {:ssl => {:verify => false}}}
end