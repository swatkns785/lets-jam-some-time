require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "soundcloud"
    sequence(:nickname) { |n| "bunk_moreland #{n}" }
    sequence(:soundcloud_id) { |n| 10000 + n }
    permalink "http://www.bunkmoreland.com"
    avatar_url "http://img2.wikia.nocookie.net/__cb20130808014300/p__/protagonist/images/1/19/Bunk.jpg"
  end

  factory :jamsession do
    sequence(:title) { |n| "Funkytown #{n}"}
    sequence(:address) { |n| "15#{n} North Beacon Street" }
    city "Boston"
    state "MA"
    zip_code "02135"
    description "This is a jam session where we will get funky."
    sequence(:date) { |n| Date.today + n.months }
    present_instrument "Bassoon"
    desired_instruments "Oboe, clarinet, tuba"
  end

  factory :attendee do
    sequence(:user_id) { |n| 5 + n }
    approval false
    user
  end
end
