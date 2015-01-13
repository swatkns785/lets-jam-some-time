require "rails_helper"

feature "a user deletes a jam session", %q(

  As an authenticated user
  I want to delete my jamsession
  So that I no longer have the meetup

  Acceptance Criteria
  [x] I must be able to delete the jamsession from the jamsession page
  [ ] All associated attendees and comments must be deleted as well
  [ ] I must not be able to delete someone else's jam session

) do

  scenario "user successfully deletes a jam session" do

    user = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: user.id)

    sign_in_as(user)
    create_jamsession(jam)

    visit jamsession_path(jam)

    click_link "Delete this Jam Session"

    expect(page).to have_content "Your jam session has been successfully deleted."
    expect(page).to_not have_content jam.title

  end

end
