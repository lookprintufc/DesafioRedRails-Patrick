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

ActiveRecord::Schema.define(version: 20170324175511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amenities_places", force: :cascade do |t|
    t.integer  "place_id"
    t.integer  "amenitie_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["amenitie_id"], name: "index_amenities_places_on_amenitie_id", using: :btree
    t.index ["place_id"], name: "index_amenities_places_on_place_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "title"
    t.integer  "place_type_id"
    t.string   "description"
    t.integer  "room_limit"
    t.integer  "bed_limit"
    t.integer  "accomodate_limit"
    t.integer  "bathroom_limit"
    t.string   "address"
    t.decimal  "price"
    t.integer  "user_id"
    t.string   "photo"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "category_id"
    t.integer  "views",            default: 0
    t.index ["category_id"], name: "index_places_on_category_id", using: :btree
    t.index ["place_type_id"], name: "index_places_on_place_type_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "sex"
    t.date     "birthdate"
    t.date     "phone_number"
    t.string   "current_city"
    t.string   "about"
    t.string   "profile_pic"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "amenities_places", "amenities", column: "amenitie_id"
  add_foreign_key "amenities_places", "places"
  add_foreign_key "places", "categories"
  add_foreign_key "places", "place_types"
end
