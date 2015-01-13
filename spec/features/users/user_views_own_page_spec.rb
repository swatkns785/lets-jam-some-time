require "rails_helper"

feature "a user views own page", %q(

  As a user
  I want to view my own page
  So that I can see my information

  Acceptance Criteria
  [ ] I must be able to access my user page from the home page
  [ ] I must be able see my nickname, avatar, and link to my soundcloud page

) do

  scenario "user views own page" do

    OmniAuth.config.mock_auth[:soundcloud] = {
      "provider" => "soundcloud",
      "uid" => 123456789,
      "info" => {
        "nickname" => "Bunk Moreland",
        "image" => "http://img2.wikia.nocookie.net/__cb20130808014300/p__/protagonist/images/1/19/Bunk.jpg"
      },
      "credentials" => {
        "token" => "54321"
      },
      "extra" => {
        "raw_info" => {
          "permalink" => "http://soundcloud.com/bunkmoreland"
        }
      }
    }

    visit root_path

    click_link "Sign in with Soundcloud"

    expect(page).to_not have_content "Sign in with Soundcloud"

    click_link "Profile"

    expect(page).to have_content "Bunk Moreland"
    expect(page).to have_content "http://soundcloud.com/bunkmoreland"
    expect(page).to have_xpath("//img[@src=\"http://img2.wikia.nocookie.net/__cb20130808014300/p__/protagonist/images/1/19/Bunk.jpg\"]")

  end

end
