module JamsessionHelper
  def create_jamsession(jam)
    visit new_jamsession_path

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
  end
end
