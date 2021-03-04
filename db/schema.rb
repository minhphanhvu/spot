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

ActiveRecord::Schema.define(version: 2021_02_25_040811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "spot_students", force: :cascade do |t|
    t.integer "spot_id", null: false
    t.integer "student_id", null: false
  end

  create_table "spots", force: :cascade do |t|
    t.integer "lead_id", default: 0
    t.integer "course_id", null: false
    t.date "week_beginning"
    t.datetime "session_datetime"
    t.integer "student_limit"
    t.date "date_created", default: DateTime.now
    t.boolean "archive", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.boolean "is_lead", default: false
    t.boolean "is_admin", default: false
    t.datetime "created_at"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "spot_students", "spots"
  add_foreign_key "spot_students", "users", column: "student_id"
  add_foreign_key "spots", "courses"
  add_foreign_key "spots", "users", column: "lead_id"
end
