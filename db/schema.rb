# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150117223938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "jamsession_id",                 null: false
    t.boolean  "approval",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jamsessions", force: :cascade do |t|
    t.string   "title",               null: false
    t.text     "description",         null: false
    t.string   "present_instrument"
    t.datetime "date",                null: false
    t.string   "desired_instruments"
    t.integer  "user_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",             null: false
    t.string   "city",                null: false
    t.string   "state",               null: false
    t.string   "zip_code",            null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "track_title",    null: false
    t.string   "track_location", null: false
    t.integer  "user_id"
    t.integer  "jamsession_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname",      null: false
    t.string   "permalink",     null: false
    t.string   "avatar_url",    null: false
    t.integer  "soundcloud_id", null: false
    t.string   "provider",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

end
