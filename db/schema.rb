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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160105161618) do
=======
ActiveRecord::Schema.define(version: 20160121041625) do
>>>>>>> 79bd2dc746742dddb82966d561fc0650334bb314

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listing_tags", force: :cascade do |t|
    t.integer "listing_id"
    t.integer "tag_id"
  end

  add_index "listing_tags", ["tag_id"], name: "index_listing_tags_on_tag_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.integer  "bedroom"
    t.integer  "accomodates"
    t.string   "location"
    t.float    "price_per_night"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.json     "images"
  end

  add_index "listings", ["user_id", "created_at"], name: "index_listings_on_user_id_and_created_at", using: :btree
  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.date    "start_time"
    t.date    "end_time"
    t.integer "length"
    t.integer "listing_id"
    t.integer "user_id"
    t.float   "amount"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
<<<<<<< HEAD
    t.string   "phone"
=======
    t.string   "name"
    t.string   "avatar"
>>>>>>> 79bd2dc746742dddb82966d561fc0650334bb314
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "listings", "users"
end
