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

ActiveRecord::Schema.define(version: 20150117203314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allocations", force: true do |t|
    t.integer  "option_id"
    t.integer  "fact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "direction"
    t.boolean  "question"
    t.boolean  "relevant"
    t.string   "value"
  end

  create_table "clones", force: true do |t|
    t.integer  "decision_id"
    t.integer  "clone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "decision_id"
    t.integer  "option_id"
    t.string   "title"
  end

  create_table "decisions", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "email"
    t.string   "author"
    t.boolean  "closed"
    t.integer  "chosen_option"
    t.integer  "user_id"
    t.string   "state"
    t.integer  "ratio"
    t.boolean  "cloned"
    t.integer  "clone_id"
    t.boolean  "facts_enabled"
  end

  create_table "fact_assets", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "fact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fact_ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "fact_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "unset",      default: true
  end

  create_table "facts", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "decision_id"
    t.boolean  "neg"
    t.string   "description"
    t.string   "type"
  end

  create_table "guts", force: true do |t|
    t.integer  "option_id"
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "unset",      default: true
  end

  create_table "images", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "option_id"
  end

  create_table "option_assets", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "option_id"
  end

  create_table "options", force: true do |t|
    t.string   "title"
    t.integer  "decision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "rated"
    t.boolean  "selected"
    t.string   "description"
  end

  create_table "participants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "decision_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "invited"
    t.boolean  "admin"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "points", force: true do |t|
    t.integer  "fact_id"
    t.integer  "participant_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "questions", force: true do |t|
    t.integer  "question1_id"
    t.integer  "question2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fact1"
    t.integer  "fact2"
    t.boolean  "answered"
    t.integer  "chosen"
    t.integer  "user_id"
    t.integer  "fact1_id"
    t.integer  "fact2_id"
    t.boolean  "done"
  end

  create_table "searches", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

end
