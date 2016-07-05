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

ActiveRecord::Schema.define(version: 20140222131645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dataobjects", force: true do |t|
    t.string   "title"
    t.string   "type"
    t.string   "content"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "useful"
    t.boolean  "highlight"
    t.boolean  "reviewed"
    t.text     "note"
    t.integer  "rating"
    t.integer  "score"
  end

  create_table "hints", force: true do |t|
    t.string   "title"
    t.string   "lang"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
    t.string   "note"
    t.boolean  "show_title"
    t.boolean  "show_disable"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.boolean  "enable"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "custom"
    t.integer  "topic_id"
    t.boolean  "research_web",                   default: false, null: false
    t.boolean  "research_database",              default: false, null: false
    t.boolean  "research_library",               default: false, null: false
    t.boolean  "research_interview",             default: false, null: false
    t.string   "short_answer"
    t.text     "answer"
    t.text     "configured_research_categories"
    t.text     "thoughts"
  end

  create_table "researches", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "searches", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "type"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.boolean  "WebSearch"
    t.boolean  "DatabaseSearch"
    t.boolean  "LibrarySearch"
    t.boolean  "Interview"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "Survey"
  end

  create_table "terms", force: true do |t|
    t.string   "term"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "title"
    t.integer  "research_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end