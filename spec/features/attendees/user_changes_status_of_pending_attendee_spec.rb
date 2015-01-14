require "rails_helper"

feature "jam session creator approves pending request to join jam session", %q(

  As the creator of a jam session
  I want to change the status of a potential attendee
  So I can allow the potential attendee to see the location of the jam session

  [ ] I must be able change the approval status on the jam session page
  [ ] Once I change their status to approved, the attendee appears in the approved-attendee designation
  [ ] Once I approve their request to join my jam session, an email is sent to the user notifying them of the approval

) do

  scenario "user changes attendee status to approved", focus: true do

    creator = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: creator.id)
    pending_attendee = FactoryGirl.create(:attendee, jamsession_id: jam.id, approval: false)

    sign_in_as(creator)
    visit jamsession_path(jam)

    expect(page).to have_content pending_attendee.user.nickname

    pending_attendee_location = page.body.index(pending_attendee.user.nickname)
    pending_requests_text_location = page.body.index("Pending Requests")

    expect(pending_requests_text_location).to be < pending_attendee_location

    click_link "Approve this Request"
    expect(page).to_not have_content "Status: Pending"

  end

end
