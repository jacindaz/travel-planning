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

ActiveRecord::Schema.define(version: 20150308132704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "english_name",         null: false
    t.string   "native_language_name"
    t.text     "description"
    t.boolean  "is_capital",           null: false
    t.string   "city_website"
    t.integer  "region_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "english_name",         null: false
    t.string   "native_language_name"
    t.text     "description"
    t.string   "country_website"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itinerary_cities", force: :cascade do |t|
    t.integer  "city_id",      null: false
    t.integer  "itinerary_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: :cascade do |t|
    t.string   "english_name",         null: false
    t.string   "native_language_name"
    t.text     "description"
    t.string   "region_website"
    t.integer  "country_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
