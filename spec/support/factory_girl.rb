require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "soundcloud"
    nickname "bunk_moreland"
    soundcloud_id { |n| n }
    permalink "http://www.bunkmoreland.com"
    avatar_url "http://img2.wikia.nocookie.net/__cb20130808014300/p__/protagonist/images/1/19/Bunk.jpg"
  end
end
