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

ActiveRecord::Schema.define(version: 20160509142541) do

  create_table "evaluation_t", primary_key: "eval_id", force: :cascade do |t|
    t.string  "eval_name",            limit: 15,  null: false
    t.integer "member_id",            limit: 4
    t.string  "tutoring_comments",    limit: 100, null: false
    t.string  "math_module_comments", limit: 100, null: false
    t.string  "math_sw_comments",     limit: 100, null: false
    t.string  "eng_comments",         limit: 100, null: false
    t.string  "eng_sw_comments",      limit: 100, null: false
    t.string  "suggestions",          limit: 100, null: false
  end

  add_index "evaluation_t", ["member_id"], name: "member_id", using: :btree

  create_table "member_t", primary_key: "member_id", force: :cascade do |t|
    t.string  "password",       limit: 15
    t.string  "first_name",     limit: 15, null: false
    t.string  "last_name",      limit: 15, null: false
    t.string  "middle_initial", limit: 2
    t.string  "email_address",  limit: 30, null: false
    t.integer "contact_no",     limit: 4,  null: false
    t.date    "attendance"
    t.string  "arm",            limit: 15
    t.string  "committee",      limit: 15
    t.date    "birthday"
    t.string  "year_course",    limit: 12, null: false
    t.string  "scholarship",    limit: 15
  end

  create_table "module_t", primary_key: "lesson_id", force: :cascade do |t|
    t.string  "file_name",      limit: 20,  null: false
    t.string  "subject",        limit: 20
    t.date    "upload_date",                null: false
    t.string  "topic",          limit: 20,  null: false
    t.integer "member_id",      limit: 4
    t.string  "file_file_name", limit: 255
  end

  add_index "module_t", ["member_id"], name: "member_id", using: :btree

  create_table "tpr_t", primary_key: "tpr_id", force: :cascade do |t|
    t.integer "week_no",    limit: 4,   null: false
    t.string  "school",     limit: 35,  null: false
    t.integer "lesson_id",  limit: 4
    t.integer "member_id",  limit: 4
    t.integer "tutee_id",   limit: 4,   null: false
    t.string  "strengths",  limit: 20,  null: false
    t.string  "weaknesses", limit: 20,  null: false
    t.string  "actions",    limit: 100, null: false
  end

  add_index "tpr_t", ["lesson_id"], name: "lesson_id", using: :btree
  add_index "tpr_t", ["member_id"], name: "member_id", using: :btree
  add_index "tpr_t", ["tutee_id"], name: "tpr_fk3", using: :btree

  create_table "tutee_t", primary_key: "tutee_id", force: :cascade do |t|
    t.string  "first_name",        limit: 15, null: false
    t.string  "last_name",         limit: 15, null: false
    t.string  "school",            limit: 35, null: false
    t.integer "math_grade",        limit: 4
    t.integer "eng_grade",         limit: 4
    t.string  "address",           limit: 30
    t.string  "father_name",       limit: 30
    t.string  "father_occupation", limit: 10
    t.string  "mother_name",       limit: 30
    t.string  "mother_occupation", limit: 10
    t.string  "ambition",          limit: 15
    t.string  "fav_subject",       limit: 10
    t.string  "fav_food",          limit: 8
    t.string  "fav_color",         limit: 10
    t.string  "fav_movie",         limit: 10
    t.date    "attendance"
    t.string  "current_module",    limit: 20
    t.integer "group_no",          limit: 4,  null: false
  end

  create_table "worksheet_t", primary_key: "worksheet_id", force: :cascade do |t|
    t.integer "lesson_id",     limit: 4
    t.integer "member_id",     limit: 4
    t.integer "tutee_id",      limit: 4,  null: false
    t.string  "school",        limit: 35, null: false
    t.integer "score",         limit: 4,  null: false
    t.string  "reached_quota", limit: 1,  null: false
  end

  add_index "worksheet_t", ["lesson_id"], name: "worksheet_fk1", using: :btree
  add_index "worksheet_t", ["member_id"], name: "member_id", using: :btree
  add_index "worksheet_t", ["tutee_id"], name: "worksheet_fk3", using: :btree

  add_foreign_key "evaluation_t", "member_t", column: "member_id", primary_key: "member_id", name: "evaluation_t_ibfk_1"
  add_foreign_key "module_t", "member_t", column: "member_id", primary_key: "member_id", name: "module_t_ibfk_1"
  add_foreign_key "tpr_t", "member_t", column: "member_id", primary_key: "member_id", name: "tpr_t_ibfk_1"
  add_foreign_key "tpr_t", "module_t", column: "lesson_id", primary_key: "lesson_id", name: "tpr_t_ibfk_2"
  add_foreign_key "tpr_t", "tutee_t", column: "tutee_id", primary_key: "tutee_id", name: "tpr_fk3"
  add_foreign_key "worksheet_t", "member_t", column: "member_id", primary_key: "member_id", name: "worksheet_t_ibfk_1"
  add_foreign_key "worksheet_t", "tutee_t", column: "tutee_id", primary_key: "tutee_id", name: "worksheet_fk3"
end
