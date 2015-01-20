class Track < ActiveRecord::Base

  def self.upload_to_soundcloud(track, upload_user)
    if Rails.env.development? || Rails.env.test?
      user = upload_user

      client = Soundcloud.new(client_id: ENV['DEV_SOUNDCLOUD_CLIENT_ID'], client_secret: ENV['DEV_SOUNDCLOUD_SECRET'], access_token: user.token)

      track = client.post('/tracks', :track => {
        title: track[:track_title],
        asset_data: File.new(track[:song_file].tempfile, 'rb') })

      track.save

    elsif Rails.env.production?
      user = upload_user

      client = Soundcloud.new(client_id: ENV['PROD_SOUNDCLOUD_CLIENT_ID'], client_secret: ENV['PROD_SOUNDCLOUD_SECRET'], access_token: user.token)

      track = client.post('/tracks', :track => {
        title: track[:track_title],
        asset_data: File.new(track[:song_file].tempfile, 'rb') })

      track.save
    end

  end

end
