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

ActiveRecord::Schema.define(version: 20170814205856) do

  create_table "entries", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_entries_on_plant_id"
    t.index ["tag_id"], name: "index_entries_on_tag_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "common_names"
    t.integer "watering_time"
    t.integer "sunlight_exposure"
    t.integer "summer_environment"
    t.integer "winter_environment"
    t.text "description"
    t.string "info_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_plants", force: :cascade do |t|
    t.integer "plant_id"
    t.integer "user_id"
    t.string "custom_name"
    t.text "notes"
    t.datetime "last_watered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_user_plants_on_plant_id"
    t.index ["user_id"], name: "index_user_plants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
