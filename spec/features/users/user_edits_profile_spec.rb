require 'rails_helper'

feature 'a user edits their profile', %q(

  As a user
  I want to edit my profile
  So that I can change my email address

) do

  scenario "user edits profile" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit user_path(user)

    click_link "Edit Profile"

    expect(page).to have_content user.nickname

    fill_in "Email", with: "bunkmoreland@gmail.com"

    click_button "Update"

    expect(page).to have_content "Your account has been successfully updated."

  end

end
