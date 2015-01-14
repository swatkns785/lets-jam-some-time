require "rails_helper"

feature "an approved attendee leaves a jam session", %q(

  As an approved attendee
  I want to leave a jam session
  So that I am no longer associated with that jam session

  Acceptance Criteria
  [x] I must be able to leave the jam session from the jam session page
  [x] Upon successfully leaving the jam session, I receive an message notifying me of success
  [ ] If I created the jam session, I cannot leave the jam session. I must delete it

) do

  scenario "user successfully leaves jam session" do

    creator = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: creator.id)
    approved_attendee = FactoryGirl.create(:attendee, jamsession_id: jam.id, approval: true)

    sign_in_as(approved_attendee.user)

    visit jamsession_path(jam)

    click_link "Leave this Jam Session"

    expect(page).to have_content "You have successfully left this jam session."
    expect(page).to have_content "Join this Jam Session"

  end

end
