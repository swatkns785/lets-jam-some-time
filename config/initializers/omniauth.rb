Rails.application.config.middleware.use OmniAuth::Builder do
  provider "soundcloud", ENV['PROD_SOUNDCLOUD_CLIENT_ID'], ENV['PROD_SOUNDCLOUD_SECRET']
end
