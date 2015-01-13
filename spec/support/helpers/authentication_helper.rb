module AuthenticationHelper
  def sign_in_as(user)
    OmniAuth.config.mock_auth[:soundcloud] = {
      "provider" => user.provider,
      "uid" => user.soundcloud_id,
      "info" => {
        "nickname" => "user.nickname",
        "image" => "http://img2.wikia.nocookie.net/__cb20130808014300/p__/protagonist/images/1/19/Bunk.jpg"
      },
      "credentials" => {
        "token" => "54321"
      },
      "extra" => {
        "raw_info" => {
          "permalink" => user.permalink
        }
      }
    }

    visit root_path

    click_link "Sign in with Soundcloud"
  end
end
