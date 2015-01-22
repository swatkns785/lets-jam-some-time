require "rails_helper"

feature "a user signs in", %q(
  As a user
  I want to sign in with my Soundcloud credentials
  So that I can use this app

  Acceptance Criteria
  [ ] I must be able to sign in from the home page
  [ ] If I provide a valid Soundcloud account, I am signed in

) do

  scenario "user signs in successfully" do

    OmniAuth.config.mock_auth[:soundcloud] = {
      "provider" => "soundcloud",
      "uid" => 123456789,
      "info" => {
        "nickname" => "Bunk Moreland",
        "image" => "http://img2.wikia.nocookie.net/__cb20130808014300/p__/protagonist/images/1/19/Bunk.jpg",
        "permalink" => "http://soundcloud.com/linkthis"
      },
      "credentials" => {
        "token" => "54321"
      },
      "extra" => {
        "raw_info" => {
          "permalink_url" => "http://soundcloud.com/bunkmoreland"
        }
      }
    }

    visit root_path

    click_link "Sign in with Soundcloud"

    expect(page).to have_content "Successfully signed in as Bunk Moreland"

  end

end
