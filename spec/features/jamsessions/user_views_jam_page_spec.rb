require 'rails_helper'

feature "user views jam session page", %q(

  As a user
  I want to view a jam session page
  So that I can see if I want to attend

) do

  scenario "unauthenicated user views a jam session page" do

    jam = FactoryGirl.create(:jamsession)

    visit jamsession_path(jam)

  end

end
