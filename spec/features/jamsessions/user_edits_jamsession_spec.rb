require "rails_helper"

feature "a user edits a jamsession", %q(

As an authenticated user
I want to edit my jamsession
So that I can change the details of my meetup

Acceptance Criteria
[x] I must be able to edit the title, time, location, and description
[x] Upon successfully editing a jamsession, I must see an message indicating success
[ ] If I make errors, I am prompted with the appropriate error messages

) do

  scenario "user successfully edits jamsession" do

    user = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: user.id)

    sign_in_as(user)
    create_jamsession(jam)

    click_link "Edit this Jam Session"

    fill_in "Title", with: "James Brown Tribute Hour"
    fill_in "Location", with: "5446 Chuck Berry Avenue, Berryville, MD 20015"
    fill_in "Description", with: "A tribute to the legend, James Brown."
    select "2015", from: "jamsession_date_1i"
    select "March", from: "jamsession_date_2i"
    select "14", from: "jamsession_date_3i"
    select "08 PM", from: "jamsession_date_4i"
    select "55", from: "jamsession_date_5i"
    fill_in "Present instrument", with: "Electric bass"
    fill_in "Desired instruments", with: "Guitar, drums x5, James Brown impersonator"
    click_button "Update"

    expect(page).to have_content "Your jam session has been successfully updated."
    expect(page).to have_content "James Brown Tribute Hour"
    expect(page).to have_content "5446 Chuck Berry Avenue, Berryville, MD 20015"
    expect(page).to have_content "A tribute to the legend, James Brown."
    expect(page).to have_content "2015-03-14 20:55:00 UTC"
    expect(page).to have_content "Electric bass"
    expect(page).to have_content "Guitar, drums x5, James Brown impersonator"
    expect(page).to_not have_content jam.title

  end

end
