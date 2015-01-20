# require "rails_helper"
#
# feature "a user uploads an audio track to Soundcloud", %q(
#
#   As a user
#   I want to upload an audio file to Soundcloud
#   So I can share the fruits of the jam session
#
# ) do
#
#   scenario "user successfully uploads an audio track" do
#
#     creator = FactoryGirl.create(:user)
#     jam = FactoryGirl.create(:jamsession, user_id: creator.id)
#
#     sign_in_as(creator)
#     visit jamsession_path(jam)
#
#     click_link "Upload a track to Soundcloud"
#
#     fill_in "Title", with: "Best Jam Ever"
#     attach_file('Audio File', 'app/assets/audio/mpthreetest.mp3')
#     click_button 'Upload'
#
#     expect(page).to have_content "Your file is currently being processed by Soundcloud. It will be available shortly."
#
#   end
#
# end


# writing a test for uploading a track to Soundcloud ultimately helped me get to the right answer, but I'm commenting it out because it will always fail because I'm using invalid credentials. Long live TDD!
