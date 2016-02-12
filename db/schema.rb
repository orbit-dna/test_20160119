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

ActiveRecord::Schema.define(version: 20160211152532) do

  create_table "sch_classes", force: :cascade do |t|
    t.integer  "grade"
    t.integer  "class_number"
    t.string   "teacher"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer  "sch_class_id"
    t.string   "name"
    t.boolean  "gender"
    t.date     "birth"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "students", ["sch_class_id"], name: "index_students_on_sch_class_id"

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "name"
    t.string   "passwd"
    t.integer  "privilege"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
