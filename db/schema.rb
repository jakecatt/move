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

ActiveRecord::Schema.define(version: 20141029150616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.integer  "user_id",                null: false
    t.string   "name",        limit: 40, null: false
    t.string   "event_photo"
    t.text     "description"
    t.datetime "event_time"
    t.integer  "age_limit"
    t.string   "link"
    t.boolean  "sold_out"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followed_id"], name: "index_follows_on_followed_id", using: :btree
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id",                null: false
    t.string   "body",       limit: 141, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "rsvps", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "rsvp_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rsvps", ["event_id"], name: "index_rsvps_on_event_id", using: :btree
  add_index "rsvps", ["user_id"], name: "index_rsvps_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "username",                            null: false
    t.string   "profile_photo",                       null: false
    t.text     "bio"
    t.string   "personal_website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
