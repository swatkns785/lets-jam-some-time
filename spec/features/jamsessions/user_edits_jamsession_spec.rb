require "rails_helper"

feature "a user edits a jamsession", %q(

  As an authenticated user
  I want to edit my jamsession
  So that I can change the details of my meetup

  Acceptance Criteria
  [x] I must be able to edit the title, time, location, and description
  [x] Upon successfully editing a jam session, I must see an message indicating success
  [x] If I make errors, I am prompted with the appropriate error messages
  [x] I must not be able to edit someone else's jam session

) do

  scenario "user successfully edits jamsession" do

    user = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: user.id)

    sign_in_as(user)
    create_jamsession(jam)

    click_link "Edit this Jam Session"

    fill_in "Title", with: "James Brown Tribute Hour"
    fill_in "Address", with: "14 St. James Place"
    fill_in "City", with: "Brooklyn"
    fill_in "State", with: "NY"
    fill_in "Zip Code", with: "11205"
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
    expect(page).to have_content "14 St. James Place"
    expect(page).to have_content "Brooklyn"
    expect(page).to have_content "NY"
    expect(page).to have_content "11205"
    expect(page).to have_content "A tribute to the legend, James Brown."
    expect(page).to have_content "March 14, 2015 @ 8:55 PM"
    expect(page).to have_content "Electric bass"
    expect(page).to have_content "Guitar, drums x5, James Brown impersonator"
    expect(page).to_not have_content jam.title

  end

  scenario "user cannot edit someone else's playlist" do

    user = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: user.id)
    user2 = FactoryGirl.create(:user)

    create_jamsession(jam)

    sign_in_as(user2)

    visit jamsession_path(jam.id)
    expect(page).to_not have_content "Edit this Jam Session"

  end

  scenario "user leaves all fields blank when editing jam session" do

    user = FactoryGirl.create(:user)
    jam = FactoryGirl.create(:jamsession, user_id: user.id)

    sign_in_as(user)
    create_jamsession(jam)

    visit edit_jamsession_path(jam)

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_button "Update"

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"

  end

end
