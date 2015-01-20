require 'soundcloud'

  def create
    client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_KEY'],
    :client_secret => ENV['SOUNDCLOUD_SECRET'],
    :redirect_uri => 'https://agile-coast-1910.herokuapp.com/auth/soundcloud/callback')
  end
  redirect_to client.authorize_url('https://agile-coast-1910.herokuapp.com')
