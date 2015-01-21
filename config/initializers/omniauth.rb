# redirect_uri = if Rails.env.production?
#   'https://agile-coast-1910.herokuapp.com/auth/soundcloud/callback'
# else
#   'localhost:3000/auth/soundcloud/callback'
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider "soundcloud",
           ENV['SOUNDCLOUD_CLIENT_ID'],
           ENV['SOUNDCLOUD_SECRET'],
           client_options: {redirect_uri: 'https://agile-coast-1910.herokuapp.com/auth/soundcloud/callback' }
end
