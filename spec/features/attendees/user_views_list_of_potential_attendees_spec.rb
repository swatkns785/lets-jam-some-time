require "rails_helper"

feature "jam session creator views list of potential attendees", %q(

  As the creator of a jam session
  I want to view a list of potential attendees
  So that I can decide who to approve

  [x] I must be able to view a list of potential attendees
  [x] I must be able to see their approval status

) do

  scenario "user views list of potential attendees" do

    creator = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: creator.id)
    approved_attendee1 = FactoryGirl.create(:attendee, jamsession_id: jam.id, approval: true)
    unapproved_attendee1 = FactoryGirl.create(:attendee, jamsession_id: jam.id, approval: false)

    sign_in_as(creator)

    visit jamsession_path(jam)

    expect(page).to have_content approved_attendee1.user.nickname
    expect(page).to have_content "Status: Approved"

    expect(page).to have_content "Pending Requests"
    expect(page).to have_content unapproved_attendee1.user.nickname
    expect(page).to have_content "Status: Pending"

  end
end
