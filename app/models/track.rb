class Track < ActiveRecord::Base

  def self.upload_to_soundcloud(track, upload_user)

    user = upload_user

    client = Soundcloud.new(client_id: ENV['SOUNDCLOUD_CLIENT_ID'], client_secret: ENV['SOUNDCLOUD_SECRET'], access_token: user.token)

    track = client.post('/tracks', :track => {
      title: track[:track_title],
      asset_data: File.new(track[:song_file].tempfile, 'rb') })

    track.save

  end

end
