require 'soundcloud'


  def create
    client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_KEY'],
    :client_secret => ENV['SOUNDCLOUD_SECRET'],
    :redirect_uri => 'http://agile-coast-1910.herokuapp.com/auth/soundcloud/callback')
  end
  redirect_to client.authorize_url(http://agile-coast-1910.herokuapp.com)
