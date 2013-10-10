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

ActiveRecord::Schema.define(version: 20131010204219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "mails",                  default: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "recycling_centers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.string   "category"
    t.text     "factions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recycling_centers", ["category"], name: "index_recycling_centers_on_category", using: :btree
  add_index "recycling_centers", ["factions"], name: "index_recycling_centers_on_factions", using: :btree
  add_index "recycling_centers", ["lat"], name: "index_recycling_centers_on_lat", using: :btree
  add_index "recycling_centers", ["lng"], name: "index_recycling_centers_on_lng", using: :btree
  add_index "recycling_centers", ["name"], name: "index_recycling_centers_on_name", using: :btree

  create_table "signs", force: true do |t|
    t.string   "name"
    t.string   "faction_number"
    t.text     "search_terms"
    t.text     "comment"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "signs", ["category"], name: "index_signs_on_category", using: :btree
  add_index "signs", ["faction_number"], name: "index_signs_on_faction_number", using: :btree
  add_index "signs", ["name"], name: "index_signs_on_name", using: :btree

end
