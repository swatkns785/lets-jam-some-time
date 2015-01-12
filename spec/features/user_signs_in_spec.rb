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

    visit root_path

    click_link "Sign in with Soundcloud"

    expect(page).to have_content "Signed in successfully."

  end

end
