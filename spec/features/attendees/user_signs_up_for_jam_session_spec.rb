require "rails_helper"

feature "a user requests to sign up for a jam session", %q(

  As a user
  I want to sign up for a jam session
  So that I can perhaps play with musicians

  Acceptance Criteria
  [x] I must be able to sign up for the jam session from the jam session page
  [x] Once I request to sign up, I am notified at my successful attempt to sign up
  [x] I must not be able to see the exact location of the jam session (city and state OK)

) do

  scenario "a user successfully attempts to sign up for a jam session" do

    creator = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: creator.id)
    attendee = FactoryGirl.create(:user)

    sign_in_as(attendee)

    visit jamsession_path(jam)

    click_link "Join this Jam Session"

    expect(page).to have_content "You have successfully requested to join this jam session. Stand by for e-mail confirmation from #{jam.user.nickname}."
    expect(page).to_not have_content jam.address

  end

end
