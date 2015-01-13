require "rails_helper"

feature "user creates jamsession", %q(

  As an authenticated user
  I want to create a jamsession
  So that I can organize music sessions with strangers

  Acceptance Criteria
  [ ] I must be able to create a jamsession from the meetups index page
  [ ] I must be able to add a title, time, location, and description
  [ ] If I make errors, I am prompted with the appropriate error messages
  [ ] Upon successful creation, I am redirected the page for the just created jamsession

) do

  scenario "user successfully creates jamsession" do

    user = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: user.id)

    sign_in_as(user)

    click_link "Create a Jam Session"

    fill_in "Title", with: jam.title
    fill_in "Location", with: jam.location
    fill_in "Description", with: jam.description
    select "2015", from: "jamsession_date_1i"
    select "January", from: "jamsession_date_2i"
    select "31", from: "jamsession_date_3i"
    select "04 PM", from: "jamsession_date_4i"
    select "20", from: "jamsession_date_5i"
    fill_in "Present instrument", with: jam.present_instrument
    fill_in "Desired instruments", with: jam.desired_instruments
    click_button "Create"

    expect(page).to have_content "Your jam session has been successfully created."

    expect(page).to have_content jam.title
    expect(page).to have_content jam.location
    expect(page).to have_content jam.description
    expect(page).to have_content "2015-01-31 16:20:00 UTC"
    expect(page).to have_content jam.present_instrument
    expect(page).to have_content jam.desired_instruments
    expect(page).to have_content jam.user.nickname

  end

end
