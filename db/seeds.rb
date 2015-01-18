require "date"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  nickname = Faker::Internet.user_name
  permalink = Faker::Internet.url
  avatar = Faker::Avatar.image
  soundcloud_id = Faker::Number.number(4)
  provider = "soundcloud"
  user = User.create(nickname: nickname, permalink: permalink, avatar_url: avatar, soundcloud_id: soundcloud_id, provider: provider)
  title = Faker::Lorem.words
  location = Faker::Address.street_address
  description = Faker::Lorem.paragraph
  present_instrument = Faker::Lorem.word
  desired_instruments = Faker::Lorem.words(4)
  Jamsession.create(title: title, location: location, description: description, present_instrument: present_instrument, desired_instruments: desired_instruments, user_id: user.id)
end


title = Faker::Lorem.words
location = Faker::Address.street_address
description = Faker::Lorem.paragraph
present_instrument = Faker::Lorem.word
desired_instruments = Faker::Lorem.words(4)


User.all.each do |user|
  title = Faker::Lorem.sentence(3)
  location = Faker::Address.street_address
  description = Faker::Lorem.paragraph
  present_instrument = Faker::Lorem.word
  desired_instruments = Faker::Lorem.words(4)
  date = DateTime.now
  Jamsession.create!(title: title, location: location, description: description, present_instrument: present_instrument, date: date, desired_instruments: desired_instruments, user_id: user.id)
  puts "Created a jam session with #{title}"
end

t.string   "title",               null: false
t.string   "location",            null: false
t.text     "description",         null: false
t.string   "present_instrument"
t.datetime "date",                null: false
t.string   "desired_instruments"
t.integer  "user_id",             null: false
t.datetime "created_at"
t.datetime "updated_at"
