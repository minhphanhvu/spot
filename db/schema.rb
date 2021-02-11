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

ActiveRecord::Schema.define(version: 2021_02_10_222154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "course_name", null: false
    t.index ["course_name"], name: "index_courses_on_course_name", unique: true
  end

  create_table "leads", force: :cascade do |t|
    t.string "slack_name", null: false
    t.string "name"
    t.string "username", null: false
    t.string "password_digest", null: false
    t.index ["slack_name"], name: "index_leads_on_slack_name", unique: true
    t.index ["username"], name: "index_leads_on_username", unique: true
  end

  create_table "spot_students", force: :cascade do |t|
    t.bigint "spot_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_spot_students_on_spot_id"
    t.index ["student_id"], name: "index_spot_students_on_student_id"
  end

  create_table "spots", force: :cascade do |t|
    t.bigint "lead_id"
    t.bigint "course_id"
    t.datetime "scheduled_at", null: false
    t.index ["course_id"], name: "index_spots_on_course_id"
    t.index ["lead_id"], name: "index_spots_on_lead_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "slack_name", null: false
    t.string "name"
    t.string "username", null: false
    t.string "password_digest"
    t.index ["slack_name"], name: "index_students_on_slack_name", unique: true
    t.index ["username"], name: "index_students_on_username", unique: true
  end

  add_foreign_key "spot_students", "spots"
  add_foreign_key "spot_students", "students"
  add_foreign_key "spots", "courses"
  add_foreign_key "spots", "leads"
end
