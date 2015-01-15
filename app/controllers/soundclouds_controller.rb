require 'soundcloud'


  def create
    client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_KEY'],
    :client_secret => ENV['SOUNDCLOUD_SECRET'],
    :redirect_uri => 'http://localhost:3000/auth/soundcloud/callback')
  end
  redirect_to client.authorize_url(http://localhost:3000)
