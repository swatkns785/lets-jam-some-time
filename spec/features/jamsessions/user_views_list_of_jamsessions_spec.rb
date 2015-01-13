require "rails_helper"

feature "user views list of jam sessions", %q(

  As a user
  I want to view a list of jam sessions
  So that I can discover new groups of people to jam with

  Acceptance Criteria
  [x] I must be able to view a list of jam sessions in sorted by newest first
  [x] Each jam session must show a title and location
  [x] Each jam session must link to their respective pages

) do

  scenario "user views list of available jam sessions" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    jam1 = FactoryGirl.create(:jamsession, user_id: user.id)
    jam2 = FactoryGirl.create(:jamsession, user_id: user.id)
    jam3 = FactoryGirl.create(:jamsession, user_id: user.id)

    visit jamsessions_path

    jam1_page_location = page.body.index(jam1.title)
    jam2_page_location = page.body.index(jam2.title)
    jam3_page_location = page.body.index(jam3.title)

    expect(page).to have_link jam1.title
    expect(page).to have_content jam1.location
    expect(page).to have_link jam2.title
    expect(page).to have_content jam2.location
    expect(page).to have_link jam3.title
    expect(page).to have_content jam3.location

    expect(jam2_page_location).to be < jam1_page_location
    expect(jam3_page_location).to be < jam2_page_location

  end

end
