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

ActiveRecord::Schema.define(version: 20150505142632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignment_ratings", force: :cascade do |t|
    t.integer  "assignment_id"
    t.integer  "participant_id"
    t.integer  "rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "option_id"
    t.integer  "fact_id"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.integer  "option_id"
    t.integer  "participant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "decision_id"
  end

  create_table "decisions", force: :cascade do |t|
    t.string   "title",                    limit: 255
    t.string   "description",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "general_invitation_token"
    t.integer  "admin_id"
    t.string   "state"
    t.integer  "selected_id"
  end

  create_table "fact_ratings", force: :cascade do |t|
    t.float    "value"
    t.integer  "fact_id"
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "facts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "decision_id"
    t.integer  "creator_id"
    t.string   "datatype"
  end

  create_table "feelings", force: :cascade do |t|
    t.float    "value"
    t.integer  "option_id"
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "favourite"
  end

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.integer  "option_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "options", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "decision_id"
    t.integer  "creator_id"
    t.string   "link"
    t.string   "description"
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "email",            limit: 255
    t.string   "status",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token", limit: 255
    t.integer  "decision_id"
  end

end
