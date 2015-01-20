require 'rails_helper'

feature "a user searches for a jam session", %q(

  As a user
  I want to find a jam session near me
  So that I can meet and play music with new people

  [ ] I must be able to search for a jam session from the index
  [ ] I must only see results that match my input

) do

  scenario "user searches for a jam session" do
    user = FactoryGirl.create(:user)
    @jamsession1 = FactoryGirl.create(:jamsession)
    @jamsession2 = FactoryGirl.create(:jamsession)
    create_jamsession(@jamsession1)
    create_jamsession(@jamsession2)
    sign_in_as(user)

    visit root_path
    fill_in :query, with: "Funkytown"
    click_button "Search"

    expect(page).to have_link @jamsession1.title
    expect(page).to have_link @jamsession2.title

  end

end
