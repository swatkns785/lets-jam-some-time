require "rails_helper"

feature "user views approved attendees", %q(

  As an approved attendee
  I want to view other attendees
  So I can check out their profiles

  Acceptance Criteria
  [x] I must be able to view other approved attendees on individual jam session page

) do

  scenario "user views approved attendees" do

    creator = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: creator.id)
    attendee1 = FactoryGirl.create(:attendee, approval: true, jamsession_id: jam.id)
    attendee2 = FactoryGirl.create(:attendee, approval: false, jamsession_id: jam.id)

    sign_in_as(attendee1.user)

    visit jamsession_path(jam)

    expect(page).to have_content attendee1.user.nickname
    expect(page).to_not have_content attendee2.user.nickname

  end

end
