require 'soundcloud'

if Rails.env.development?
  client = Soundcloud.new(:client_id => ENV['DEV_SOUNDCLOUD_CLIENT_ID'],
  :client_secret => ENV['DEV_SOUNDCLOUD_SECRET'],
  :redirect_uri => 'http://localhost:3000/auth/soundcloud/callback')
end

if Rails.env.production?
  client = Soundcloud.new(:client_id => ENV['PROD_SOUNDCLOUD_CLIENT_ID'],
  :client_secret => ENV['PROD_SOUNDCLOUD_SECRET'],
  :redirect_uri => 'https://agile-coast-1910.herokuapp.com/auth/soundcloud/callback')
end


# if Rails.env.development? || Rails.env.test?
#   redirect_to client.authorize_url('http://localhost:3000')
# elsif Rails.env.production?
#   redirect_to client.authorize_url(:redirect_uri => 'https://agile-coast-1910.herokuapp.com/')
# end
