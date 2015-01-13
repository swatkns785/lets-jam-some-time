require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "soundcloud"
    sequence(:nickname) { |n| "bunk_moreland |n|" }
    soundcloud_id 100001
    permalink "http://www.bunkmoreland.com"
    avatar_url "http://img2.wikia.nocookie.net/__cb20130808014300/p__/protagonist/images/1/19/Bunk.jpg"
  end

  factory :jamsession do
    sequence(:title) { |n| "Funkytown #{n}"}
    location "123 Main Street, Allston, MA 02135"
    description "This is a jam session where we will get funky."
    sequence(:date) { |n| Date.today + n.months }
    present_instrument "Bassoon"
    desired_instruments "Oboe, clarinet, tuba"
  end
end
