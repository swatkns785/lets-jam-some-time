class User < ActiveRecord::Base
  has_many :jamsessions, through: :attendees
  has_many :attendees

  def self.find_or_create_from_omniauth(auth)
    account_credentials = { soundcloud_id: auth["uid"], provider: auth["provider"] }

    user = User.find_or_initialize_by(account_credentials)
    user.nickname = auth["info"]["nickname"]
    user.permalink = auth["extra"]["raw_info"]["permalink_url"]
    user.avatar_url = auth["info"]["image"]
    user.token = auth["credentials"]["token"]
    user.save!
    user
  end

end
